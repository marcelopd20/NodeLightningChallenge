//
//  RankedConectivityNodesViewModel.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import Foundation
import SwiftUI
@MainActor
final class RankedConnectivityNodesViewModel: ObservableObject {

    @Published var nodes = [NodeModel]()
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    @Published var presentAlert: Bool = false
    @Published var searchNode: String = "" 
    var filteredNodes: [(index_: Int, nodeModel: NodeModel)] {

        guard !searchNode.isEmpty else { return nodes.enumerated().map { (index, nodeModel) in (index_: index, nodeModel: nodeModel) } }

        return nodes.enumerated().filter { index, nodeModel in
            nodeModel.alias.lowercased().contains(searchNode.lowercased())
        }.map { (index, nodeModel) in (index_: index, nodeModel: nodeModel) }

    }
    @Published var currentPage: Int = 0
    let itemsPerPage: Int = 10
    var paginatedNodes: [(index_: Int, nodeModel: NodeModel)] {
        guard searchNode.isEmpty else { return Array(filteredNodes) }

        let startIndex = currentPage * itemsPerPage
        let endIndex = min(startIndex + itemsPerPage, filteredNodes.count)
        return Array(filteredNodes[startIndex..<endIndex])
    }

    func getNodes() {
        isLoading = true
        Task {
            do {
                let rawNodes = try await NetworkManager.shared.getNodes()
                await MainActor.run {
                    nodes = rawNodes.map { $0.toNodeModel() }
                }
                self.isLoading = false
            } catch {
                if let mpError = error as? MPError {
                    switch mpError {
                        case .invalidURL:
                            self.alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            self.alertItem = AlertContext.invalidResponse
                        case .invalidData:
                            self.alertItem = AlertContext.invalidData
                        case .unableToComplete:
                            self.alertItem = AlertContext.unableToComplete
                    }
                } else {
                    self.alertItem = AlertContext.unableToComplete
                }
                DispatchQueue.main.async {
                    self.presentAlert = true
                }
            }
        }
    }

    func toOrdinal(_ place: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        formatter.locale = Locale(identifier: "pt-BR")
        return formatter.string(from: NSNumber(value: place)) ?? ""
    }

    func dateFormatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}



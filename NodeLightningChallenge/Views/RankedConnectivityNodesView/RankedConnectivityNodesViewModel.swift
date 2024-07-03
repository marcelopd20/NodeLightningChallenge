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

    @Published var nodes: [NodeModel] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    @Published var presentAlert: Bool = false

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
}

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

struct AlertContext {
    static let invalidData     = AlertItem(title: "Server Error",
                                        message: "The data received from the server was invalid. Plese Contact support.")
    static let invalidResponse = AlertItem(title: "Server Error",
                                        message: "Invalid response from the server. Please try again later or contact support")
    static let invalidURL      = AlertItem(title: "Server Error",
                                        message: "There was an issue connecting to the server. If this persists, please contact support.")
    static let unableToComplete = AlertItem(title: "Server Error",
                                        message: "Unable to complete your request at this time. Please check your connection.")

}

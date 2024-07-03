//
//  RankedConectivityNodesViewModel.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import Foundation

@MainActor
final class RankedConnectivityNodesViewModel: ObservableObject {

    @Published var nodes: [NodeModel] = []
    @Published var isLoading: Bool = false

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
                throw MPError.unableToComplete
            }
        }
    }
}

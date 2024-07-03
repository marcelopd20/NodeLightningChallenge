//
//  RankedConectivityNodesViewModel.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import Foundation

final class RankedConnectivityNodesViewModel: ObservableObject {

    @Published var nodes: [RawNode] = []
    @Published var isLoading: Bool = false

    func getNodes() {
        isLoading = true
        Task {
            do {
                let rawNodes = try await NetworkManager.shared.getNodes()
                nodes = rawNodes
            } catch {
                throw MPError.unableToComplete
            }
        }
        isLoading = false
    }
}

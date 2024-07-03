//
//  RankedConectivityNodesView.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import SwiftUI

struct RankedConnectivityNodesView: View {
    @StateObject var viewModel = RankedConnectivityNodesViewModel()

    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(.vertical) {
                    ForEach(viewModel.paginatedNodes, id:\.index_) { (index, node) in
                        NodeCardView(alias: node.alias,
                                     index: viewModel.toOrdinal(index + 1),
                                     country: node.country ?? "",
                                     city: node.city ?? "",
                                     channels: node.channels,
                                     firstSeen: viewModel.dateFormatter(node.firstSeen),
                                     updateAt: viewModel.dateFormatter(node.updatedAt),
                                     btcCapacity: node.btcCapacity)
                    }
                    if viewModel.searchNode.isEmpty {
                        PagingNodeListView(currentPage: $viewModel.currentPage)
                    }
                }
                .task {
                    viewModel.getNodes()
                }
            }
            .refreshable {
                    viewModel.getNodes()
            }
            if viewModel.isLoading {
                LoadingView()
            }

        }
        .alert(viewModel.alertItem?.message ?? "Entrar em contato com suporte", isPresented: $viewModel.presentAlert) {
            Button("OK", role: .cancel) { viewModel.presentAlert = false }
        }
        .navigationTitle("Top 100 Conectividade")
        .searchable(text: $viewModel.searchNode, prompt: "Buscar")

    }
}

#Preview {
    NavigationStack {
        RankedConnectivityNodesView()
    }
}



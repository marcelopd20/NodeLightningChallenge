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
                    VStack {
                        Text("Página \(viewModel.currentPage + 1) de 10")
                            .font(.system(.title3, design: .rounded, weight: .bold))
                        HStack {

                            Button {
                                if viewModel.currentPage > 0 {
                                    viewModel.currentPage -= 1
                                }
                            } label: {
                                Text("Voltar")
                                    .font(.system(.title3, design: .rounded, weight: .semibold))
                                    .padding()
                                    .foregroundStyle(Color.white)
                                    .background(Color(.darkBlue1))
                                    .clipShape(.rect(cornerRadius: 12))
                            }
                            Spacer()
                            Button {
                                if viewModel.currentPage < 10 {
                                    viewModel.currentPage += 1
                                }
                            } label: {
                                Text("Avançar")
                                    .font(.system(.title3, design: .rounded, weight: .semibold))
                                    .padding()
                                    .foregroundStyle(Color.white)
                                    .background(Color(.darkBlue1))
                                    .clipShape(.rect(cornerRadius: 12))
                            }
                        }.padding()
                    }.padding()
                }
                .task {
                    viewModel.getNodes()
                }
            }
            .refreshable {
                DispatchQueue.main.async {
                    viewModel.getNodes()
                }
            }
            if viewModel.isLoading {
                LoadingView()
            }

        }
        .alert(viewModel.alertItem?.message ?? "Contact Support", isPresented: $viewModel.presentAlert) {
            Button("OK", role: .cancel) { viewModel.presentAlert = false }
        }
        .navigationTitle("Top 100 Conectividade")
        .searchable(text: $viewModel.searchNode)

    }
}

#Preview {
    NavigationStack {
        RankedConnectivityNodesView()
    }
}


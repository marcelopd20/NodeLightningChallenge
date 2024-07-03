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
                    ForEach(Array(viewModel.nodes.enumerated()), id:\.offset) { index, node in
                        LazyVStack(spacing: 0) {
                            HStack(alignment: .center) {
                                Text(viewModel.toOrdinal(index + 1))
                                    .font(.system(.largeTitle, design: .rounded, weight: .black))
                                Text(node.alias)
                                    .font(.system(.title2, design: .rounded, weight: .bold))
                                    .multilineTextAlignment(.center)
                            }
                            HStack(alignment: .center) {
                                VStack(alignment: .leading) {
                                    Text("Cidade")
                                        .font(.system(.headline, design: .rounded, weight: .black))
                                    Text("\(node.city ?? "")")
                                    Text("País")
                                        .font(.system(.headline, design: .rounded, weight: .black))
                                    Text("\(node.country ?? "")")
                                    Text("Atualizado")
                                        .font(.system(.headline, design: .rounded, weight: .black))
                                    Text(viewModel.dateFormatter(node.updatedAt))
                                }
                                Spacer()

                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("Canais")
                                        .font(.system(.headline, design: .rounded, weight: .black))
                                    Text("\(node.channels)")
                                    Text("Aparição")
                                        .font(.system(.headline, design: .rounded, weight: .black))
                                        .multilineTextAlignment(.trailing)
                                    Text(viewModel.dateFormatter(node.firstSeen))
                                }

                            }
                            .padding()
                            .background(Color.indigo)
                            VStack {
                                Text("Capacity")
                                    .font(.system(.title3, design: .rounded, weight: .black))
                                Text("\(node.btcCapacity) BTC")
                            }.frame(maxWidth: .infinity)
                            .background(Color.blue)
                        }

                    }
                }.listStyle(.inset)
                .listRowSpacing(10)
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
        .navigationTitle("Top 100 Connectivity")
        .toolbarBackground(Color.gray, for: .navigationBar)

    }
}

#Preview {
    NavigationStack {
        RankedConnectivityNodesView()
    }
}

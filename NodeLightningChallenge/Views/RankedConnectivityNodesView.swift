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
                List {
                    ForEach(viewModel.nodes) { node in
                        Text(node.alias)
                    }
                }
                .task {
                    viewModel.getNodes()
                }
            }
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

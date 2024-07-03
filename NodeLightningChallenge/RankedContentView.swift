//
//  ContentView.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 02/07/24.
//

import SwiftUI

// TODO: Desenvolver na UI - Intuitiva, dinâmica, metodo para atualizar dados
// TODO: Testar
// TODO: Readme

struct RankedContentView: View {
    var body: some View {
        NavigationStack {
            RankedConnectivityNodesView()
        }
    }
}

#Preview {
    RankedContentView()
}

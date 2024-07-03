//
//  ContentView.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 02/07/24.
//

import SwiftUI

// TODO: Criar tratamento de exceções da api
// TODO: Criar testes para função e verificar erros atraves dos testes
// TODO: Desenvolver na UI - Intuitiva, dinâmica, metodo para atualizar dados
// TODO: Tratar dados para apresentar na UI 1 BTC = 1e8 sats
// TODO: Exibir estado de loading
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

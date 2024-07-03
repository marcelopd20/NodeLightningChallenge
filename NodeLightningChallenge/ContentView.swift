//
//  ContentView.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 02/07/24.
//

import SwiftUI

// TODO: Criar model para json de node
// TODO: Criar função para conectar na api - https://mempool.space/api/v1/lightning/nodes/rankings/connectivity , unix time, pt-br senão en,
// TODO: Criar tratamento de exceções da api
// TODO: Criar testes para função e verificar erros atraves dos testes
// TODO: Desenvolver na UI - Intuitiva, dinâmica, metodo para atualizar dados
// TODO: Tratar dados para apresentar na UI 1 BTC = 1e8 sats
// TODO: Exibir estado de loading
// TODO: Testar
// TODO: Readme

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

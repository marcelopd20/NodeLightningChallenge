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
    @State var nodes: [Node] = []
    var body: some View {
        VStack {
            ForEach(nodes, id:\.publicKey) { node in
                Text("\(node.alias)")
            }
        }.onAppear(perform: {
            API() { nodes in
                self.nodes = nodes
                print(self.nodes)
            }
        })
        .padding()
    }
    func API(completion: @escaping ([Node]) -> ()) {
        guard let url = URL(string: "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity") else {
            print("erro")
            return
        }
        URLSession.shared.dataTask(with: url) { data,response,error in
            let nodes = try! JSONDecoder().decode([Node].self, from: data!)
            print(nodes)
            DispatchQueue.main.async {
                completion(nodes)
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
struct Node: Decodable {
    let publicKey: String?
    let alias: String?
    let channels: Int?
    let capacity: Int?
    let firstSeen: Int?
    let updatedAt: Int?
    let city: [String: String]?
    let country: [String: String]?
}

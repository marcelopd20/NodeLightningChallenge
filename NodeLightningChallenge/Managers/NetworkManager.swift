//
//  NetworkManager.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 02/07/24.
//

import Foundation
// TODO: Criar função para conectar na api - lightning/nodes/rankings/connectivity , unix time, pt-br senão en,

final class NetworkManager {

    static let shared = NetworkManager()
    private init() {}

    static let baseURL = "https://mempool.space/api/v1/"
    private let endpoint = baseURL + "lightning/nodes/rankings/connectivity"

    func getNodes() async throws -> [RawNode] {
        guard let url = URL(string: endpoint) else { throw MPError.invalidURL }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw MPError.invalidResponse }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode([RawNode].self, from: data)

        } catch {
            throw MPError.invalidData
        }

    }
}


enum MPError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

//
//  RawNode.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import Foundation

struct RawNode: Decodable {
    let publicKey: String
    let alias: String
    let channels: Int
    let capacity: Int
    let firstSeen: Int
    let updatedAt: Int
    let city: [String: String]?
    let country: [String: String]?

    func convertToBTC() -> Double {
        return Double(capacity) / 1e8
    }
}

extension RawNode: NodeToModel {
    func toNodeModel() -> NodeModel {
        let firstSeenDate = Date(timeIntervalSince1970: TimeInterval(firstSeen))
        let updatedAtDate = Date(timeIntervalSince1970: TimeInterval(updatedAt))
        let cityName = city?["pt-BR"] ?? city?["en"] ?? "Desconhecido"
        let countryName = country?["pt-BR"] ?? country?["en"] ?? "Desconhecido"
        
        return NodeModel(publicKey: publicKey,
                         alias: alias,
                         channels: channels,
                         btcCapacity: convertToBTC(),
                         firstSeen: firstSeenDate,
                         updatedAt: updatedAtDate,
                         city: cityName,
                         country: countryName)
    }
}

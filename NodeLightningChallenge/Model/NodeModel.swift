//
//  NodeModel.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import Foundation

protocol NodeToModel {
    func toNodeModel() -> NodeModel
}

struct NodeModel: Identifiable {
    let id = UUID()
    let publicKey: String
    let alias: String
    let channels: Int
    let btcCapacity: Double
    let firstSeen: Date
    let updatedAt: Date
    let city: String?
    let country: String?
}

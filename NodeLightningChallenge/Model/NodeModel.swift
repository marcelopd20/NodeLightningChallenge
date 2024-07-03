//
//  NodeModel.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 02/07/24.
//

import Foundation

protocol NodeToModel {
    func toNodeModel() -> NodeModel
}

struct NodeModel: Identifiable {
    var id: UUID = UUID()
    let publicKey: String
    let alias: String
    let channels: Int
    let capacity: Int
    let firstSeen: Date
    let updatedAt: Date
    let city: String
    let country: String

}

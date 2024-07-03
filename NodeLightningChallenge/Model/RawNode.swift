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
}

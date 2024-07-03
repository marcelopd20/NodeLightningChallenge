//
//  RawNodeTest.swift
//  NodeLightningChallengeTests
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import XCTest
@testable import NodeLightningChallenge

final class RawNodeTest: XCTestCase {
    func testToNodeModel() {
        // arrange
        let rawNode = RawNode(publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f",
                              alias: "ACINQ",
                              channels: 2908,
                              capacity: 36010516297,
                              firstSeen: 1522941222,
                              updatedAt: 1661274935,
                              city: nil,
                              country: ["de": "Vereinigte Staaten","en": "United States","es": "Estados Unidos","fr": "États Unis","ja": "アメリカ","pt-BR": "EUA","ru": "США","zh-CN": "美国"])
        let node = NodeModel(publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f",
                             alias: "ACINQ",
                             channels: 2908,
                             btcCapacity: Double(36010516297) / 1e8,
                             firstSeen: Date(timeIntervalSince1970: TimeInterval(1522941222)),
                             updatedAt: Date(timeIntervalSince1970: TimeInterval(1661274935)),
                             city: "Desconhecido",
                             country: "EUA")
        //ACT
        let expectedNode = rawNode.toNodeModel()
        //ASSERT
        XCTAssertEqual(expectedNode.publicKey, node.publicKey)
        XCTAssertEqual(expectedNode.alias, node.alias)
        XCTAssertEqual(expectedNode.channels, node.channels)
        XCTAssertEqual(expectedNode.btcCapacity, node.btcCapacity)
        XCTAssertEqual(expectedNode.firstSeen, node.firstSeen)
        XCTAssertEqual(expectedNode.updatedAt, node.updatedAt)
        XCTAssertEqual(expectedNode.city, node.city)
        XCTAssertEqual(expectedNode.country, node.country)
    }
}

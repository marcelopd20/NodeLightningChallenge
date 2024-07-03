//
//  NodeModelTests.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import XCTest
@testable import NodeLightningChallenge

final class NodeModelTests: XCTest {

    func testConvertSatsToBTC() {
        // Arrange
        let capacity = 100000000
        let capacity2 = 550000
        let rawNode = RawNode(publicKey: "",
                              alias: "",
                              channels: 0,
                              capacity: capacity,
                              firstSeen: 0,
                              updatedAt: 0,
                              city: nil,
                              country: nil)
        let rawNode2 = RawNode(publicKey: "",
                              alias: "",
                              channels: 0,
                              capacity: capacity2,
                              firstSeen: 0,
                              updatedAt: 0,
                              city: nil,
                              country: nil)

        // ACT
        let btcCapacity = rawNode.convertToBTC()
        let btcCapacity2 = rawNode2.convertToBTC()
        // Assert
        XCTAssertEqual(btcCapacity, 1)
        XCTAssertEqual(btcCapacity2, 0.0055)
    }
}

//
//  AlertItem.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import Foundation

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

struct AlertContext {
    static let invalidData     = AlertItem(title: "Server Error",
                                        message: "The data received from the server was invalid. Plese Contact support.")
    static let invalidResponse = AlertItem(title: "Server Error",
                                        message: "Invalid response from the server. Please try again later or contact support")
    static let invalidURL      = AlertItem(title: "Server Error",
                                        message: "There was an issue connecting to the server. If this persists, please contact support.")
    static let unableToComplete = AlertItem(title: "Server Error",
                                        message: "Unable to complete your request at this time. Please check your connection.")
}

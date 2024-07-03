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
    static let invalidData     = AlertItem(title: "Erro de Servidor",
                                        message: "Dados inválidos, contatar suporte.")
    static let invalidResponse = AlertItem(title: "Erro de Servidor",
                                        message: "Resposta Inválida, por favor contatar suporte ou tentar novamente.")
    static let invalidURL      = AlertItem(title: "Erro de Servidor",
                                        message: "Problema na conexão, por favor contatar suporte ou tentar novamente.")
    static let unableToComplete = AlertItem(title: "Erro de Servidor",
                                        message: "Requisição não completada, contatar suporte ou tentar novamente.")
}

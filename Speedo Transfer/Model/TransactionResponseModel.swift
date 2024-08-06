//
//  TransactionResponseModel.swift
//  FinalProjectBM
//
//  Created by mario on 06/08/2024.
//

import Foundation

struct TransactionResponse: Codable {
    let id: Int
    let fromAccountId: Int
    let toAccountId: Int
    let amount: Double
    let timestamp: String
}

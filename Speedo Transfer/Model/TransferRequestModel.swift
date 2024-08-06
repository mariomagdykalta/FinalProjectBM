//
//  TransferRequestModel.swift
//  FinalProjectBM
//
//  Created by mario on 06/08/2024.
//

import Foundation

struct TransferRequest: Codable {
    let fromAccountId: Int
    let toAccountId: Int
    let amount: Double
}

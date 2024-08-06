//
//  AccountDetailsResponseModel.swift
//  FinalProjectBM
//
//  Created by mario on 06/08/2024.
//

import Foundation

struct AccountDetailsResponse: Codable {
    let id: Int
    let accountName: String
    let balance: Double
}

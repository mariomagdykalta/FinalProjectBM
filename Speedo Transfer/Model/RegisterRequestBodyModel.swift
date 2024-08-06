//
//  RegisterRequestBodyModel.swift
//  FinalProjectBM
//
//  Created by mario on 06/08/2024.
//

import Foundation

struct RegisterRequestBody: Codable {
    let firstName: String
    let lastName: String
    let gender: String
    let email: String
    let phoneNumber: String
    let address: String
    let nationality: String
    let nationalNumber: String
    let dateOfBirth: String
    let password: String
}

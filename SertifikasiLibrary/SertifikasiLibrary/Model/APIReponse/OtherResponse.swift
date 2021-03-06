//
//  Login.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import Foundation

struct Login: Codable {
    let status: String
    let message: String
    let is_admin: String
}

struct NewProduct: Codable {
    let status: String
    let message: String
    let product_id: Int
}

struct DefaultResponse: Codable {
    let status: String
    let message: String
}

//
//  User.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import Foundation

struct Customer: Codable {
    let id_user: Int
    let username: String
    let is_admin: Int
    let password: String
}

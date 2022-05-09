//
//  User.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import Foundation

struct Customer: Codable {
    let id_user: String
    let username: String
    let is_admin: String
    let password: String
}

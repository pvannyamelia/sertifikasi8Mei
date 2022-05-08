//
//  Transaction.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import Foundation

struct Transaction: Codable {
    let id_transaction: Int
    let id_product: Int
    let id_user: Int
    let borrow_date: String
    let deadline: String
    let return_date: String
}

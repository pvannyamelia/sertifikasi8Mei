//
//  Transaction.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import Foundation

struct Transaction: Codable {
    let id_transaction: String
    let id_product: String
    let id_user: String
    let borrow_date: String
    let deadline: String
    let return_date: String
}

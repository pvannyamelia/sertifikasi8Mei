//
//  Product.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import Foundation

struct Product: Codable {
    let id_product: Int
    let id_ctg: Int
    let product_name: String
    let available: Int
}

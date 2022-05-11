//
//  ProductAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import Foundation

class AllProductAPI: APIProtocol {
    
    var productArray = [Product]()
    
    // get URLs
    let getAllProductURL: String
    
    init() {
        // get APIs
        self.getAllProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/allProduct.php"
    }
    
    static let shared = AllProductAPI()
}

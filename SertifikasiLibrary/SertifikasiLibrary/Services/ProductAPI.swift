//
//  ProductAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import Foundation
class ProductAPI {
    // get URL
    let getProductbyIDURL: String
    let getProductCtgbyIDURL: String
    
    // update URL
    let updateProductURL: String
    
    // insert URL
    let insertProductURL: String
    
    // delete URL
    let deleteProductURL: String
    
    init() {
        // get API append dengan product / category ID
        self.getProductbyIDURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/product.php?product="
        self.getProductCtgbyIDURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/productCtg.php?ctg="
        
        // update API
        self.updateProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/editProduct.php"
        
        // insert API
        self.insertProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/newProduct.php"
        
        // delete API append dengan product ID
        self.deleteProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/removeProduct.php?product="
    }
    
    func newProduct(completion: @escaping()->()) {
        
    }
}

//
//  ProductAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import Foundation
class ProductAPI: APIProtocol {
    // insert response variables
    var status: Bool?
    var message: String?
    var productId: Int?
    static var shared = ProductAPI()
    
    // get product by ID response variables
    var product: Product?
    
    // get URL
    let getProductbyIDURL: String
    
    // update URL
    let updateProductURL: String
    
    // insert URL
    let insertProductURL: String
    
    // delete URL
    let deleteProductURL: String
    
    init() {
        // get API append dengan product
        self.getProductbyIDURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/product.php?id_product="
        
        // update API
        self.updateProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/editProduct.php"
        
        // insert API
        self.insertProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/newProduct.php"
        
        // delete API append dengan product ID
        self.deleteProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/removeProduct.php?product="
    }
    
    func parseJSON(data: Data) {
        let response: DefaultResponse = try! JSONDecoder().decode(DefaultResponse.self, from: data)
        self.status = response.status == "200" ? true : false
        self.message = response.message
    }
}

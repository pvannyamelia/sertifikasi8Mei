//
//  AllCategoryAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import Foundation

class CategoryAPI: APIProtocol {
    
    var ctgArray = [Product_Ctg]()
    
    // get URLs
    let getAllCategoryURL: String
    let getProductCtgbyIDURL: String
    
    init() {
        // get APIs
        self.getAllCategoryURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/allProductCtg.php"
        // append dengan ctgID
        self.getProductCtgbyIDURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/productCtg.php?ctg="
    }
    
    static let shared = CategoryAPI()
}

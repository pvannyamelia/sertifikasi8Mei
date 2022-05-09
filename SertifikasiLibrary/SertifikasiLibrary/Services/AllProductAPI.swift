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
    
    func getAllProduct(completion: @escaping ()->()) {
        let task = URLSession.shared.dataTask(with: URL(string: self.getAllProductURL)!) { data, response, error  in
            guard let data = data, error == nil else {
                print("Something's wrong")
                return
            }
                // parse JSON
            self.parseJSON(data: data)
            completion()
        }
        task.resume()
    }
    
    func parseJSON(data: Data) {
        let productsResponse: [Product] = try! JSONDecoder().decode([Product].self, from: data)
        self.productArray = productsResponse
    }
}

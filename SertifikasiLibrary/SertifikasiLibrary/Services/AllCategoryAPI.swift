//
//  AllCategoryAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import Foundation

class AllCategoryAPI: APIProtocol {
    
    var ctgArray = [Product_Ctg]()
    
    // get URLs
    let getAllCategoryURL: String
    
    init() {
        // get APIs
        self.getAllCategoryURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/allProductCtg.php"
    }
    
    static let shared = AllCategoryAPI()
    
    func getAllCategory(completion: @escaping ()->()) {
        let task = URLSession.shared.dataTask(with: URL(string: self.getAllCategoryURL)!) { data, response, error  in
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
        let ctgResponse: [Product_Ctg] = try! JSONDecoder().decode([Product_Ctg].self, from: data)
        self.ctgArray = ctgResponse
    }
}

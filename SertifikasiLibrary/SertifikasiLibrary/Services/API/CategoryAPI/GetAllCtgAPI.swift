//
//  GetAllCtgAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 10/05/22.
//

import Foundation

extension CategoryAPI {
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

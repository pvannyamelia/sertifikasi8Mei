//
//  InsertProductAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 10/05/22.
//

import Foundation
import UIKit

extension ProductAPI {
    func newProduct(idCtg: Int, productName: String, completion: @escaping()->()) {
        let postString = "id_ctg=\(idCtg)&product_name=\(productName)"
        guard let request = APIRequest.shared.postRequest(urlString: self.insertProductURL, postString: postString) else { return }
        if(!productName.isEmpty && idCtg != 0){
            // hit request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data=data, error == nil else {
                    return
                }
                self.parseInsertJSON(data: data)
                completion()
            }
            task.resume()
        } else {
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data=data, error == nil else {
                    return
                }

                self.parseJSON(data: data)
                completion()
            }
            task.resume()
        }
    }
    
    func parseInsertJSON(data: Data){
        let insertResponse: NewProduct = try! JSONDecoder().decode(NewProduct.self, from: data)
        if insertResponse.status == "200" {
            self.status = true
            self.productId = insertResponse.product_id
        } else {
            self.status = false
        }
        self.message = insertResponse.message
    }
}

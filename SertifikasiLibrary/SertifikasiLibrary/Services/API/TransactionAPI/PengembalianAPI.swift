//
//  PengembalianAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 11/05/22.
//

import Foundation

extension TransactionAPI {
    func pengembalian(idProduct: String, idTransaction: String, completion: @escaping ()->()) {
        let postString = "id_product=\(idProduct)&id_transaction=\(idTransaction)"
        print(idTransaction)
        guard let request = APIRequest.shared.postRequest(urlString: self.pengembalianURL, postString: postString) else { return }
        
        // hit request
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

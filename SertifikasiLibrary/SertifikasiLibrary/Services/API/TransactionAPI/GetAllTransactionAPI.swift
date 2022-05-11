//
//  GetAllTransactionAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 11/05/22.
//

import Foundation

extension TransactionAPI {
    func getAllTransaction(completion: @escaping ()->()) {
        let task = URLSession.shared.dataTask(with: URL(string: self.getAllTransactionURL)!) { data, response, error in
            guard let data = data, error == nil else {
                print(error.debugDescription)
                return
            }

            self.parseTransactionJSON(data: data)
            completion()
        }
        task.resume()
    }
    
    func parseTransactionJSON(data: Data) {
        let transactionResponse: [Transaction] = try! JSONDecoder().decode([Transaction].self, from: data)
        self.transactionArray = transactionResponse
    }
}

//
//  TransactionAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import Foundation

class TransactionAPI: APIProtocol {
    static var shared = TransactionAPI()
    
    // API response vars
    var status: Bool?
    var message: String?
    var transactionArray = [Transaction]()
    
    let getAllTransactionURL: String
    let peminjamanURL: String
    let pengembalianURL: String
    
    init() {
        self.getAllTransactionURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Transaction/allTransaction.php"
        self.peminjamanURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Transaction/borrowRequest.php"
        self.pengembalianURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Transaction/return.php"
    }
    
    func parseJSON(data: Data) {
        let updateResponse: DefaultResponse = try! JSONDecoder().decode(DefaultResponse.self, from: data)
        self.status = updateResponse.status == "200" ? true : false
        self.message = updateResponse.message
    }
}

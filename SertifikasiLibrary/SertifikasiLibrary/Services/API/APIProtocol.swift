//
//  APIProtocol.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import Foundation

protocol APIProtocol {
    func parseJSON(data: Data)
}

/* To test JSON Response:
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
            }
 */

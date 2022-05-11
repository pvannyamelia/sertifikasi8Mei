//
//  PostRequest.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 11/05/22.
//

import Foundation

class APIRequest {
    static var shared = APIRequest()
    
    func postRequest(urlString: String, postString: String) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            print("failed to create URL")
            return nil
        }
        var request = URLRequest(url: url)
        
        // add method & body
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        return request
    }
}

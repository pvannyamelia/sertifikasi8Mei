//
//  LoginAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import Foundation
import CryptoKit

class LoginAPI: APIProtocol {
    let username: String
    let password: String
    var isAdmin: Bool?
    var status: Bool?
    var message: String?
    
    init (username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func login(completion: @escaping ()->()) {
        let postString = "username=\(self.username)&password=\(self.password)"
        let request = APIRequest.shared.postRequest(urlString: "http://localhost:8888/SertifikasiLibraryAPI/service/Login/login.php", postString: postString)
        
        // hit request
        let task = URLSession.shared.dataTask(with: request!) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            self.parseJSON(data: data)
            completion()
        }
        task.resume()
    }
    
    func parseJSON(data: Data) {
        let loginResponse: Login = try! JSONDecoder().decode(Login.self, from: data)
        if loginResponse.status == "200" {
            self.status = true
            self.isAdmin = loginResponse.is_admin == "1" ? true : false
        } else {
            self.status = false
        }
        self.message = loginResponse.message
    }
    
}

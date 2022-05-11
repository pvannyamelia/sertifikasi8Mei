//
//  ShowAlert.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 10/05/22.
//

import Foundation
import UIKit

class AlertService {
    static var shared = AlertService()
    
    func showAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        
        return alert
    }
}

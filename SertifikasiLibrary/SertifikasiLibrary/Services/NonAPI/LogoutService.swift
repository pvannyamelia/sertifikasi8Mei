//
//  LogoutService.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import Foundation
import UIKit

class Logout {
    static var shared = Logout()
    func logout(currentView: UIViewController) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        DispatchQueue.main.async {
            let nextVC = main.instantiateViewController(withIdentifier: "login") as UIViewController
            nextVC.modalPresentationStyle = .fullScreen
            currentView.present(nextVC, animated: true)
        }
    }
}

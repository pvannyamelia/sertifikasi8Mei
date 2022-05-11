//
//  ViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var lbError: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        let username = usernameTF.text ?? ""
        let password = passwordTF.text ?? ""

        if (!(username.isEmpty || password.isEmpty)) {
            let loginAPI = LoginAPI(username: username, password: password)
            loginAPI.login {
                let main = UIStoryboard(name: "Main", bundle: nil)
                if ((loginAPI.status ?? false) && (loginAPI.isAdmin ?? false)) {
                    // user adalah admin
                    DispatchQueue.main.async {
                        let nextVC = main.instantiateViewController(withIdentifier: "adminTabBar") as UIViewController
                        nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: true) {
                            self.lbError.text = ""
                        }
                    }
                } else if ((loginAPI.status ?? false) && !(loginAPI.isAdmin ?? true)) {
                    // user bukan admin
                    DispatchQueue.main.async {
                        let nextVC = main.instantiateViewController(withIdentifier: "customerCatalogue") as UIViewController
                        nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: true) {
                            self.lbError.text = ""
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.lbError.text = loginAPI.message
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


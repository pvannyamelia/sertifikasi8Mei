//
//  ViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        let productAPI = ProductAPI(productID: 1, productCtgID: 1)
        productAPI.getAllProduct()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


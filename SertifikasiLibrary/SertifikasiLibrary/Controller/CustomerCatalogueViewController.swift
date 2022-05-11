//
//  CustomerHomeViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import UIKit

class CustomerCatalogueViewController: UIViewController {
    @IBAction func btLogout(_ sender: Any) {
        Logout.shared.logout(currentView: self)
    }
    @IBOutlet weak var tvCatalogue: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

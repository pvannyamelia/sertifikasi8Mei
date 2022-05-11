//
//  CustomerHomeViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import UIKit

class CustomerCatalogueViewController: UIViewController {
    var productID: String?
    let allProductAPI = AllProductAPI.shared
    
    @IBAction func btLogout(_ sender: Any) {
        Logout.shared.logout(currentView: self)
    }
    @IBOutlet weak var tvCatalogue: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }
    
    func fetchData() {
        allProductAPI.getAllProduct(completion: {
            DispatchQueue.main.async {
                self.tvCatalogue.delegate = self
                self.tvCatalogue.dataSource = self
                self.tvCatalogue.reloadData()
            }
        })
    }
}

extension CustomerCatalogueViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProductAPI.productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogueCell", for: indexPath) as? CustomerViewTableViewCell
        let product = allProductAPI.productArray[indexPath.row]
        cell?.setProduct(product: product)
        return cell ?? CustomerViewTableViewCell()
    }
}

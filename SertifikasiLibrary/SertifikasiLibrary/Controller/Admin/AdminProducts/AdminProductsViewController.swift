//
//  AdminHomeViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import UIKit

class AdminProductsViewController: UIViewController {
    
    let allProductAPI = AllProductAPI.shared
    
    @IBOutlet weak var tvProduct: UITableView!
    @IBAction func btLogout(_ sender: Any) {
        Logout.shared.logout(currentView: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allProductAPI.getAllProduct(completion: {
            DispatchQueue.main.async {
                self.tvProduct.delegate = self
                self.tvProduct.dataSource = self
                self.tvProduct.reloadData()
            }
        })
    }
}

extension AdminProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
}

extension AdminProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProductAPI.productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? AdminProductsTableViewCell
        let product = allProductAPI.productArray[indexPath.row]
        cell?.setProduct(product: product)
        return cell ?? AdminProductsTableViewCell()
    }
}

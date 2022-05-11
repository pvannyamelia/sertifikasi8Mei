//
//  AdminHomeViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import UIKit

class AdminProductsViewController: UIViewController {
    var productID: String?
    let allProductAPI = AllProductAPI.shared
    
    @IBOutlet weak var tvProduct: UITableView!
    @IBAction func btLogout(_ sender: Any) {
        Logout.shared.logout(currentView: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mainToEdit" && self.productID != nil) {
            let editProductVC = segue.destination as! EditProductViewController
            editProductVC.productID = self.productID
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.fetchData()
    }
    
    func fetchData() {
        allProductAPI.getAllProduct(completion: {
            DispatchQueue.main.async {
                self.tvProduct.delegate = self
                self.tvProduct.dataSource = self
                self.tvProduct.reloadData()
            }
        })
    }
}

extension AdminProductsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProductAPI.productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? AdminProductsTableViewCell
        let product = allProductAPI.productArray[indexPath.row]
        cell?.setProduct(product: product)
        return cell ?? AdminProductsTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.productID = allProductAPI.productArray[indexPath.row].id_product
        self.performSegue(withIdentifier: "mainToEdit", sender: self)
    }
}

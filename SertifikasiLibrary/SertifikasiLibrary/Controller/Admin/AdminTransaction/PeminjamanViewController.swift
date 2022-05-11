//
//  PeminjamanViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 11/05/22.
//

import UIKit

class PeminjamanViewController: UIViewController {
    @IBOutlet weak var tvProduct: UITableView!
    var productID: String?
    let allProductAPI = AllProductAPI.shared
    let transactionAPI = TransactionAPI.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

extension PeminjamanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProductAPI.productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "borrowProduct", for: indexPath) as? PeminjamanTableViewCell
        let product = allProductAPI.productArray[indexPath.row]
        cell?.setProduct(product: product)
        return cell ?? CustomerViewTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transactionAPI.peminjaman(idProduct: allProductAPI.productArray[indexPath.row].id_product) {
            DispatchQueue.main.async {
                let alert = AlertService.shared.showAlert(message: self.transactionAPI.message ?? "Can't retrieve message")
                self.present(alert, animated: true)
                self.dismiss(animated: true)
            }
        }
    }
}

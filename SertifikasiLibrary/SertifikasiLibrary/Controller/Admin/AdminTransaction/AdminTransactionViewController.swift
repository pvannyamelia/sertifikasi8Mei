//
//  AdminTransactionViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import UIKit

class AdminTransactionViewController: UIViewController {
    var transaction: Transaction?
    let allTransactionAPI = TransactionAPI.shared
    
    @IBOutlet weak var tvTransaction: UITableView!
    
    @IBAction func btLogout(_ sender: Any) {
        Logout.shared.logout(currentView: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "transactionDetail" && self.transaction != nil) {
            let transactionDetailVC = segue.destination as! DetailTransaksiViewController
            transactionDetailVC.transaction = self.transaction
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
        allTransactionAPI.getAllTransaction {
            DispatchQueue.main.async {
                self.tvTransaction.delegate = self
                self.tvTransaction.dataSource = self
                self.tvTransaction.reloadData()
            }
        }
    }
}

extension AdminTransactionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTransactionAPI.transactionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as? AdminTransactionTableViewCell
        let transaction = allTransactionAPI.transactionArray[indexPath.row]
        cell?.setTransaction(transaction: transaction)
        return cell ?? AdminTransactionTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.transaction = allTransactionAPI.transactionArray[indexPath.row]
        self.performSegue(withIdentifier: "transactionDetail", sender: self)
    }
}

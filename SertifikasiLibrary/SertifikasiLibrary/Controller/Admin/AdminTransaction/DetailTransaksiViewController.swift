//
//  DetailTransaksiViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 11/05/22.
//

import UIKit

class DetailTransaksiViewController: UIViewController {
    let imageService = ImageService()
    public var transaction: Transaction?
    var image: ProductImage?
    let transactionAPI = TransactionAPI.shared
    
    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var lbJudul: UILabel!
    @IBOutlet weak var lbBorrowDate: UILabel!
    @IBOutlet weak var lbDeadline: UILabel!
    @IBOutlet weak var lbReturnDate: UILabel!
    @IBAction func btReturn(_ sender: Any) {
        transactionAPI.pengembalian(idProduct: transaction?.id_product ?? "0", idTransaction: transaction?.id_transaction ?? "0") {
            DispatchQueue.main.async {
                let alert = AlertService.shared.showAlert(message: self.transactionAPI.message ?? "Can't retrieve message")
                self.present(alert, animated: true)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var btReturnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            if (self.transaction?.return_date != "-") {
                self.btReturnOutlet.isEnabled = false
                self.btReturnOutlet.isHidden = true
            } else {
                self.btReturnOutlet.isEnabled = true
                self.btReturnOutlet.isHidden = false
            }
            self.image = self.imageService.retrieveImage(productID: self.transaction?.id_product ?? "0")
            self.ivProduct.image = UIImage(data: (self.image?.image) ?? Data())
            self.lbJudul.text = self.transaction?.product_name
            self.lbBorrowDate.text = self.transaction?.borrow_date
            self.lbDeadline.text = self.transaction?.deadline
            self.lbReturnDate.text = self.transaction?.return_date
        }
    }
}

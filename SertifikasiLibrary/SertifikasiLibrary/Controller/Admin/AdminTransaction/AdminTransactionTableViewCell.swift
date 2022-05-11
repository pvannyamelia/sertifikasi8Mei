//
//  AdminTransactionTableViewCell.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 11/05/22.
//

import UIKit

class AdminTransactionTableViewCell: UITableViewCell {
    @IBOutlet weak var lbJudul: UILabel!
    @IBOutlet weak var lbBorrowDate: UILabel!
    @IBOutlet weak var lbDeadline: UILabel!
    @IBOutlet weak var lbReturnDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    func setTransaction(transaction: Transaction) {
        self.lbJudul.text = transaction.product_name
        self.lbBorrowDate.text = "Borrow Date: \(transaction.borrow_date)"
        self.lbDeadline.text = "Deadline: \(transaction.deadline)"
        self.lbReturnDate.text = "Return Date: \( transaction.return_date)"
    }
}

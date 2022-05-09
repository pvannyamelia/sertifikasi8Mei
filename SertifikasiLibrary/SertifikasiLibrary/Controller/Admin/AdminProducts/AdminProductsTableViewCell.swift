//
//  AdminProductsTableViewCell.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import UIKit

class AdminProductsTableViewCell: UITableViewCell {
    @IBOutlet weak var ivGambar: UIImageView?
    @IBOutlet weak var labelJudul: UILabel?
    @IBOutlet weak var labelStatus: UILabel?
    var productID: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProduct(product: Product) {
        ivGambar?.image = UIImage(named: "square.and.arrow.up")
        labelJudul?.text = product.product_name
        labelStatus?.text = product.available == "1" ? "Available" : "Unavailable"
        labelStatus?.textColor = product.available == "1" ? UIColor.green : UIColor.red
        self.productID = product.id_product
    }
}
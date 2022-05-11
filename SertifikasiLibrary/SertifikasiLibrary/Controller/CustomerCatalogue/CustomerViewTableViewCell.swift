//
//  CustomerViewTableViewCell.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 11/05/22.
//

import UIKit

class CustomerViewTableViewCell: UITableViewCell {
    @IBOutlet weak var ivProductPicture: UIImageView!
    @IBOutlet weak var lbJudul: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
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
        self.productID = product.id_product
        self.imageHandler()
        self.lbJudul?.text = product.product_name
        self.lbStatus?.text = product.available == "1" ? "Available" : "Unavailable"
        self.lbStatus?.textColor = product.available == "1" ? UIColor.green : UIColor.red
    }
    
    private func imageHandler() {
        let imageService = ImageService()
        DispatchQueue.main.async {
            let image = imageService.retrieveImage(productID: "\(self.productID)")
            self.ivProductPicture?.image = UIImage(data: (image.image) ?? Data())
        }
    }
}

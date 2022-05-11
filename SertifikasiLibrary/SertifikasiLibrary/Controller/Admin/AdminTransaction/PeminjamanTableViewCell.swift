//
//  PeminjamanTableViewCell.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 11/05/22.
//

import UIKit

class PeminjamanTableViewCell: UITableViewCell {
    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var tvJudul: UILabel!
    @IBOutlet weak var tvStatus: UILabel!
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
        self.tvJudul?.text = product.product_name
        self.tvStatus?.text = product.available == "1" ? "Available" : "Unavailable"
        self.tvStatus?.textColor = product.available == "1" ? UIColor.green : UIColor.red
    }
    
    private func imageHandler() {
        let imageService = ImageService()
        DispatchQueue.main.async {
            let image = imageService.retrieveImage(productID: "\(self.productID)")
            self.ivProduct?.image = UIImage(data: (image.image) ?? Data())
        }
    }
}

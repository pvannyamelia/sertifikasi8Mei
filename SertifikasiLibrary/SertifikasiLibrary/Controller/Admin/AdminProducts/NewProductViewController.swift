//
//  NewProductViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import UIKit

class NewProductViewController: UIViewController {
    let allCategoryAPI = CategoryAPI.shared
    let productAPI = ProductAPI.shared
    var categories: [Int: String] = [:]
    var picker = UIPickerView()
    var pickedCtg: Int?
    var productID: Int?
    
    // tutorial
    var images = [ProductImage]()

    @IBOutlet weak var ivProductPic: UIImageView!
    @IBOutlet weak var ctgTF: UITextField!
    @IBOutlet weak var judulTF: UITextField!
    
    @IBAction func btAddProductPic(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    @IBAction func btSubmit(_ sender: Any) {
        // insert to mysql
        productAPI.newProduct(idCtg: pickedCtg ?? 1, productName: judulTF.text ?? "") {
            // completion block
            self.productID = self.productAPI.productId
            
            // save image to coredata
            if (self.productAPI.status ?? false){
                DispatchQueue.main.async {
                    let imageService = ImageService()
                    let message = imageService.saveImage(image: self.ivProductPic.image ?? UIImage(), productId: String(self.productID ?? 0))
                    self.showAlert(message: message)
                }
            } else {
                DispatchQueue.main.async {
                    self.showAlert(message: self.productAPI.message ?? "")
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allCategoryAPI.getAllCategory {
            self.allCategoryAPI.ctgArray.forEach { product_ctg in
                self.categories[Int(product_ctg.id_ctg)!] = product_ctg.ctg_name
            }
        }
        picker.delegate = self
        picker.dataSource = self
        ctgTF.inputView = picker
    }
    
    private func showAlert(message: String) {
        let alert = AlertService.shared.showAlert(message: message)
        self.present(alert, animated: true)
    }
}

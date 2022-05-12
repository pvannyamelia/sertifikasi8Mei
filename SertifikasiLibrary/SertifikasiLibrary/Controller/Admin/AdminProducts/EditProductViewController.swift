//
//  EditProductViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import UIKit

class EditProductViewController: UIViewController {
    let imageService = ImageService()
    let allCategoryAPI = CategoryAPI.shared
    let productAPI = ProductAPI.shared
    var image: ProductImage?
    var categories: [Int: String] = [:]
    var picker = UIPickerView()
    var pickedCtg: Int?
    public var productID: String?
    
    @IBOutlet weak var ivProductImage: UIImageView!
    @IBOutlet weak var judulTF: UITextField!
    @IBOutlet weak var ctgTF: UITextField!
    
    @IBAction func btImagePicker(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    @IBAction func btDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Data Deletion", message: "Your data will be deleted, do you wish to proceed?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Proceed", style: .destructive, handler: { action in
            self.productAPI.deleteProduct(productID: self.productID ?? "0") {
                DispatchQueue.main.async {
                    let alert = AlertService.shared.showAlert(message: self.productAPI.message ?? "Failed to retrieve message")
                    self.present(alert, animated: true)
                    self.dismiss(animated: true)
                }
            }
        }))
        self.present(alert, animated: true)
    }
    
    @IBAction func btSave(_ sender: Any) {
        if((judulTF.text != self.productAPI.product?.product_name) || (pickedCtg != Int(self.productAPI.product?.id_ctg ?? "0"))) {
            let product = Product(id_product: productID ?? "0", id_ctg: "\(pickedCtg ?? 1)", product_name: judulTF.text ?? "Error while fetching name", available: self.productAPI.product?.available ?? "0")
            productAPI.editProduct(product: product) {
                if (self.productAPI.status ?? false){
                    self.updateImage()
                } else {
                    DispatchQueue.main.async {
                        self.showAlert(message: self.productAPI.message ?? "Failed to retrieve message")
                    }
                }
            }
        } else {
            self.updateImage()
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
        
        productAPI.getProductbyProductID(productId: self.productID ?? "0") {
            self.inputDatatoView()
        }
    }
    
    private func inputDatatoView(){
        let picked_ctg = Int(self.productAPI.product?.id_ctg ?? "0")
        DispatchQueue.main.async {
            self.image = self.imageService.retrieveImage(productID: self.productID ?? "0")
            self.ivProductImage.image = UIImage(data: (self.image?.image) ?? Data())
            self.judulTF.text = self.productAPI.product?.product_name
            self.picker.selectRow(picked_ctg ?? 0, inComponent: 0, animated: true)
            self.pickerView(self.picker, didSelectRow: picked_ctg ?? 0, inComponent: 0)
        }
    }
    
    private func showAlert(message: String) {
        let alert = AlertService.shared.showAlert(message: message)
        self.present(alert, animated: true)
    }
    
    private func updateImage() {
        DispatchQueue.main.async {
            let message = self.imageService.updateImage(productID: self.productID ?? "0", image: self.ivProductImage.image ?? UIImage())
            self.showAlert(message: message)
        }
    }
}

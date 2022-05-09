//
//  NewProductViewController.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 09/05/22.
//

import UIKit

class NewProductViewController: UIViewController {
    let allCategoryAPI = AllCategoryAPI.shared
    var categories: [Int: String] = [:]
    var picker = UIPickerView()
    var pickedCtg = 0

    @IBOutlet weak var ivProductPic: UIImageView!
    @IBOutlet weak var ctgTF: UITextField!
    
    @IBAction func btAddProductPic(_ sender: Any) {
    }
    @IBAction func tfJudul(_ sender: Any) {
    }
    @IBAction func btSubmit(_ sender: Any) {
        
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
}

extension NewProductViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count+1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ctgTF.text = categories[row]
        ctgTF.resignFirstResponder()
        pickedCtg = row
    }
}

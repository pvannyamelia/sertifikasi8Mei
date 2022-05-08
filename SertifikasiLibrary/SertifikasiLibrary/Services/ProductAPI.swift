//
//  ProductAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//

import Foundation

class ProductAPI {
    var productID: Int
    var productCtgID: Int
    var productsArr: [Product] = []
    
    // get URLs
    let getAllProductURL: String
    let getAllCategoryURL: String
    let getProductbyIDURL: String
    let getProductCtgbyIDURL: String
    
    // update URL
    let updateProductURL: String
    
    // insert URL
    let insertProductURL: String
    
    // delete URL
    let deleteProductURL: String
    
    init(productID: Int, productCtgID: Int) {
        self.productID = productID
        self.productCtgID = productCtgID
        
        // get APIs
        self.getAllProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/allProduct.php"
        self.getAllCategoryURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/allProductCtg.php"
        self.getProductbyIDURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/product.php?product=\(productID)"
        self.getProductCtgbyIDURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/productCtg.php?ctg=\(productCtgID)"
        
        // update API
        self.updateProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/editProduct.php"
        
        // insert API
        self.insertProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/newProduct.php"
        
        // delete API
        self.deleteProductURL = "http://localhost:8888/SertifikasiLibraryAPI/service/Product/removeProduct.php?product=\(productID)"
    }
    
    
    func getAllProduct() {
        let task = URLSession.shared.dataTask(with: URL(string: self.getAllProductURL)!) { data, response, error  in
            guard let data = data, error == nil else {
                print("Something's wrong")
                return
            }
            
            var products = NSArray()
            do{
                products = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
//                products.forEach { product in
//                    productsArr.append(Product(id_product: , id_ctg: <#T##Int#>, product_name: <#T##String#>, available: <#T##Int#>))
//                }
                
            } catch let error as NSError {
                print(error)
            }
        }
        task.resume()
    }
    
}

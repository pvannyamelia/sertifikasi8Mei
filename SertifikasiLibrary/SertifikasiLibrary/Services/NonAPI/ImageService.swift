//
//  ImageService.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 10/05/22.
//

import Foundation
import UIKit
import CoreData

class ImageService {
    
    func saveImage(image: UIImage, productId: String) -> String {
        let context = self.createContext()
        let imgObject = NSEntityDescription.insertNewObject(forEntityName: "ProductImage", into: context) as! ProductImage

        imgObject.image = image.jpegData(compressionQuality: 1) as Data?
        imgObject.id_product = productId
        do {
            try context.save()
            return "Data has been saved!"
        } catch {
            return "Error occured while saving data"
        }
    }
    
    func retrieveImage(productID: String) -> ProductImage {
        var image = [ProductImage]()
        let context = self.createContext()
        let fetchReq = self.createFetchReq(productID: productID)
        do {
            image = try context.fetch(fetchReq) as! [ProductImage]
        } catch {
            print("Error while fetching data")
        }
        return image[0]
    }
    
    func updateImage(productID: String, image: UIImage) -> String {
        var fetchedImage = [ProductImage]()
        let context = self.createContext()
        let fetchReq = self.createFetchReq(productID: productID)
        do {
            fetchedImage = try context.fetch(fetchReq) as! [ProductImage]
            fetchedImage[0].setValue(image.pngData(), forKey: "image")
            try context.save()
            return "Data has been saved!"
        } catch {
            return "Error while saving data"
        }
    }
    
    func deleteProduct(productID: String) -> String {
        var fetchedImage = [ProductImage]()
        let context = self.createContext()
        let fetchReq = self.createFetchReq(productID: productID)
        do {
            fetchedImage = try context.fetch(fetchReq) as! [ProductImage]
            context.delete(fetchedImage[0])
            try context.save()
            return "Product has been deleted"
        } catch {
            return "Error while deleting data"
        }
    }
    
    private func createFetchReq(productID: String) -> NSFetchRequest<NSFetchRequestResult> {
        let filter = productID
        let predicate = NSPredicate(format: "id_product = %@", filter)
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductImage")
        fetchReq.predicate = predicate
        return fetchReq
    }
    
    private func createContext() -> NSManagedObjectContext {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
}

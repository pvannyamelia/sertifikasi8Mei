//
//  ProductImage+CoreDataProperties.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 08/05/22.
//
//

import Foundation
import CoreData


extension ProductImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductImage> {
        return NSFetchRequest<ProductImage>(entityName: "ProductImage")
    }

    @NSManaged public var id_product: Int32
    @NSManaged public var image: Data?

}

extension ProductImage : Identifiable {

}

//
//  Car+CoreDataProperties.swift
//  SixtApp
//
//  Created by muhammad Yawar on 12/23/22.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var modelIdentifier: String?
    @NSManaged public var modelName: String?
    @NSManaged public var make: String?
    @NSManaged public var group: String?
    @NSManaged public var color: String?
    @NSManaged public var series: String?
    @NSManaged public var fuelType: String?
    @NSManaged public var fuelLevel: Double
    @NSManaged public var transmission: String?
    @NSManaged public var licensePlate: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var innerCleanliness: String?
    @NSManaged public var carImageUrl: String?

}

extension Car : Identifiable {

}

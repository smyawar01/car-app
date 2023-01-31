//
//  ManagedCar+CoreDataProperties.swift
//  SixtApp
//
//  Created by muhammad Yawar on 1/30/23.
//
//

import Foundation
import CoreData


extension ManagedCar {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedCar> {
        return NSFetchRequest<ManagedCar>(entityName: "ManagedCar")
    }

    @NSManaged public var carImageUrl: String?
    @NSManaged public var color: String?
    @NSManaged public var fuelLevel: Double
    @NSManaged public var fuelType: String?
    @NSManaged public var group: String?
    @NSManaged public var id: String?
    @NSManaged public var innerCleanliness: String?
    @NSManaged public var latitude: Double
    @NSManaged public var licensePlate: String?
    @NSManaged public var longitude: Double
    @NSManaged public var make: String?
    @NSManaged public var modelIdentifier: String?
    @NSManaged public var modelName: String?
    @NSManaged public var name: String?
    @NSManaged public var series: String?
    @NSManaged public var transmission: String?

}

extension ManagedCar : Identifiable {

}

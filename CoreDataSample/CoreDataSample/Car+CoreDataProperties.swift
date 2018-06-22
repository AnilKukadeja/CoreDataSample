//
//  Car+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Anil Kukadeja on 22/06/18.
//  Copyright © 2018 Anil Kukadeja. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var model: String?
    @NSManaged public var year: Int16
    @NSManaged public var user: User?

}

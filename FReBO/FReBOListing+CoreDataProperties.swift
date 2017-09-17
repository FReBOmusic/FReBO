//
//  FReBOListing+CoreDataProperties.swift
//  FReBO
//
//  Created by FreBOMusic on 9/17/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import Foundation
import CoreData


extension FReBOListing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FReBOListing> {
        return NSFetchRequest<FReBOListing>(entityName: "FReBOListing")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var id: String?
    @NSManaged public var price: Double
    @NSManaged public var text: String?
    @NSManaged public var user: FReBOUser?

}

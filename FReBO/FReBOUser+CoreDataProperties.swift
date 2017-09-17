//
//  FReBOUser+CoreDataProperties.swift
//  FReBO
//
//  Created by FreBOMusic on 9/17/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import Foundation
import CoreData


extension FReBOUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FReBOUser> {
        return NSFetchRequest<FReBOUser>(entityName: "FReBOUser")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var id: String?
    @NSManaged public var lastname: String?
    @NSManaged public var username: String?
    @NSManaged public var verified: Bool
    @NSManaged public var listings: NSSet?

}

// MARK: Generated accessors for listings
extension FReBOUser {

    @objc(addListingsObject:)
    @NSManaged public func addToListings(_ value: FReBOListing)

    @objc(removeListingsObject:)
    @NSManaged public func removeFromListings(_ value: FReBOListing)

    @objc(addListings:)
    @NSManaged public func addToListings(_ values: NSSet)

    @objc(removeListings:)
    @NSManaged public func removeFromListings(_ values: NSSet)

}

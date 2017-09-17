//
//  FReBOListing+CoreDataClass.swift
//  FReBO
//
//  Created by FreBOMusic on 9/17/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import Foundation
import CoreData

@objc(FReBOListing)
public class FReBOListing: NSManagedObject {
    
    class func listingWithFReBOInfo(fReBOInfo: FBListing, inManagedObjectContext context: NSManagedObjectContext) -> FReBOListing? {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FReBOListing")
        request.predicate = NSPredicate(format: "unique = %@", fReBOInfo.id)
        
        if let listing = (try? context.fetch(request))?.first as? FReBOListing {
            return listing
        } else if let listing = NSEntityDescription.insertNewObject(forEntityName: "FReBOListing", into: context) as? FReBOListing {
            listing.unique = fReBOInfo.id
            listing.price = fReBOInfo.price
            listing.text = fReBOInfo.text
            listing.user = FReBOUser.fReBOUserWithInfo(fReBOInfo.user, inManagedObjectContext: context)
            return listing
        }
        
        return nil
    }
}

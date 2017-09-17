//
//  FReBOUser+CoreDataClass.swift
//  FReBO
//
//  Created by FreBOMusic on 9/17/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import Foundation
import CoreData

@objc(FReBOUser)
public class FReBOUser: NSManagedObject {
    
    class func fReBOUserWithInfo(fReBOInfo: FBUser, inManagedObjectContext context: NSManagedObjectContext) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FReBOUser")
        request.predicate = NSPredicate(format: "username = %@", fReBOInfo.username)
        
        if let fReBOUser = (try? context.fetch(request))?.first as? FReBOUser {
            return fReBOUser
        } else if let fReBOUser = NSEntityDescription.insertNewObject(forEntityName: "FReBOUser", into: context) as? FReBOUser {
            fReBOUser.screenName = fReBOInfo.screenName
            fReBOUser.name = fReBOInfo.name
        }
        
    }

}

//
//  ListingTableViewCell.swift
//  FReBO
//
//  Created by FreBOMusic on 8/15/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell {
    
    var pageViewController: ListingMediaPageViewController? {
        willSet {
            if let pvc = newValue {
                pvc.view.frame = self.contentView.bounds
                self.contentView.addSubview(pvc.view)
            } else {
                pageViewController?.removeFromParentViewController()
                pageViewController?.view.removeFromSuperview()
            }
        }
    }
    
}

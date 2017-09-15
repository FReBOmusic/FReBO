//
//  ListingMediaViewController.swift
//  FReBO
//
//  Created by FreBOMusic on 9/13/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import UIKit

class ListingMediaViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
    var index : Int = -1 //Uninitialized
    
    var link : String = "" {
        didSet {
            self.imageView = UIImageView(link: link)
        }
    }
    
    func setValues(index: Int, link: String) {
        self.index = index
        self.link = link
    }
    
}


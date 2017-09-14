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
    
    let url : URL!
    let aspectRatio : Double
    var image : UIImage?
    var index : Int = 0
    override var description: String {
        return (url.absoluteString ?? "no url") + " (aspect ratio = \(aspectRatio))"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
}

//
//  extensions.swift
//  FReBO
//
//  Created by FreBOMusic on 9/14/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        self.init(image: nil)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async {
                //perform any extra 'initialization' here
                self.image = image
            }
        }.resume()
    }
    
    convenience init(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        if let url = URL(string: link) {
            self.init(url: url, contentMode: mode)
        }
        else {
            self.init(image: nil)
        }
    }
}

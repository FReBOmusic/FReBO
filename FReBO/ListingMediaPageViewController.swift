	//
//  ListingMediaPageViewController.swift
//  FReBO
//
//  Created by FreBOMusic on 9/13/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import UIKit

class ListingMediaPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var imageMedia : [UIViewController]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let first = imageMedia?.first {
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let mediaArr = imageMedia {
            guard let viewControllerIndex = mediaArr.index(of: viewController) else { return nil }
            
            let previousIndex = viewControllerIndex - 1
            
            if previousIndex < 0 {
                return mediaArr[mediaArr.count + previousIndex]
            }
            
            return mediaArr[previousIndex]
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let mediaArr = imageMedia {
            guard let viewControllerIndex = mediaArr.index(of: viewController) else { return nil }
            
            let nextIndex = (viewControllerIndex + 1) % mediaArr.count
            
            return mediaArr[nextIndex]
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return imageMedia!.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let firstViewController = viewControllers?.first {
            if let mediaArr = imageMedia {
                guard let firstViewControllerIndex = mediaArr.index(of: firstViewController) else { return 0 }
                return firstViewControllerIndex
            }
        }
        return 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

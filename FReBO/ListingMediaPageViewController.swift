	//
//  ListingMediaPageViewController.swift
//  FReBO
//
//  Created by FreBOMusic on 9/13/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import UIKit

class ListingMediaPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var imageMedia : [String]
    var currentIndex : Int = 0
    
    convenience init(links: [String]) {
        self.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        imageMedia = links
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(index: Int, link: String) -> ListingMediaViewController {
        let listingMediaViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListingMediaViewController") as! ListingMediaViewController
        listingMediaViewController.setValues(index: index, link: link)
        return listingMediaViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let first = imageMedia.first {
            setViewControllers([setupUI(index: 0, link: first)], direction: .forward, animated: true, completion: nil)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let viewControllerIndex = (viewController as! ListingMediaViewController).index
        guard viewControllerIndex >= 0 else { return nil }
        
        var previousIndex = viewControllerIndex - 1
        
        if previousIndex < 0 {
            previousIndex += imageMedia.count
        }
        
        currentIndex = previousIndex
        return setupUI(index: previousIndex, link: imageMedia[previousIndex])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let viewControllerIndex = (viewController as! ListingMediaViewController).index
        guard viewControllerIndex >= 0 else { return nil }
        
        let nextIndex = (viewControllerIndex + 1) % imageMedia.count
        currentIndex = nextIndex
        return setupUI(index: nextIndex, link: imageMedia[nextIndex])
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return imageMedia.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
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

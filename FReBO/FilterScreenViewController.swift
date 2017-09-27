//
//  FilterScreenViewController.swift
//  FReBO
//
//  Created by FreBOMusic on 9/27/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import UIKit

class FilterScreenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filterTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Filter Table")
        addChildViewController(filterTableViewController)
        tableView = filterTableViewController.view.subviews.first as! UITableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
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

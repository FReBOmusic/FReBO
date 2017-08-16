//
//  ListingTableViewController.swift
//  FReBO
//
//  Created by FreBOMusic on 8/15/17.
//  Copyright © 2017 FReBOMusic. All rights reserved.
//

import UIKit

class ListingTableViewController: UITableViewController {

    var listings = [Array<FBListing>]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var searchText: String? {
        didSet {
            listings.removeAll()
            searchForListings()
            title = searchText
        }
    }
    
    private var lastFReBORequest: FBRequest?
    
    private var freboRequest: FBRequest? {
        if let query = searchText, !query.isEmpty {
            return FBRequest(search: query + " -filter:", count: 100)
        }
    }
    private func searchForListings() {
        if let request = freboRequest {
            lastFReBORequest = request
            request.fetchListings { [weak _self = self] newListings in
                dispatch_async(dispatch_get_main_queue()) {
                    if request == _self.lastFReBORequest {
                        if !newListings.isEmpty {
                            _self?.listings.insert(newListings, atIndex: 0)
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return listings.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings[section].count
    }

    private struct Storyboard {
        static let ListingCellIdentifier = "Listing"
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ListingCellIdentifier, for: indexPath)

        let fblisting = listings[indexPath.section][indexPath.row]
        cell.textLabel?.text = fblisting.text
        cell.detailTextLabel?.text = fblisting.user.username

        return cell
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

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
            lastFReBORequest = nil
            searchForListings()
            title = searchText
        }
    }
    
    private var lastFReBORequest: FBRequest?
    
    private var freboRequest: FBRequest? {
        if let query = searchText, !query.isEmpty {
            return FBRequest(search: query + " -filter:", count: 100)
        }
        return lastFReBORequest?.requestForNewer
    }
    
    private func searchForListings() {
        if let request = freboRequest {
            lastFReBORequest = request
            request.fetchListings { [weak _self = self] newListings in
                DispatchQueue.main.async {
                    if request == _self?.lastFReBORequest {
                        if !newListings.isEmpty {
                            _self?.listings.insert(newListings, at: 0)
                        }
                    }
                    
                    _self?.refreshControl?.endRefreshing()
                }
            }
        } else {
            self.refreshControl?.endRefreshing()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func updateDatabase(newListings: [FBListing]) {
        managedObjectContext?.performBlock {
            for listingInfo in newListings {
                // intentionally ignoring the return value
                _ = FReBOListing.listingWithFReBOInfo(listingInfo, inManagedObjectContext: self.managedObjectContext!)
            }
            // there is a method in AppDelegate
            // which will save the context as well
            // but we're just showing how to save and catch any error here
            do {
                try self.managedObjectContext?.save()
            } catch let error {
                print("Core Data Error: \(error)")
            }
        }
        // printDatabaseStatistics()
        // note that even though we do this print()
        // AFTER printDatabaseStatistics() is called
        // it will print BEFORE because printDatabaseStatistics()
        // returns immediately after putting a closure on the context's queue
        // (that closure then runs sometime later, after this print())
        print("done printing database statistics")
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

        let fbListing = listings[indexPath.section][indexPath.row]
        
        if let listingCell = cell as? ListingTableViewCell {
            listingCell.listing = fbListing
        }

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

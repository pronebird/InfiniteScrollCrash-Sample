//
//  MasterTableViewController.swift
//  InfiniteScrollCrash-Sample
//
//  Created by 구범모 on 2015. 8. 19..
//  Copyright (c) 2015년 gbmKSquare. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "Tap me!"
        return cell
    }
}

//
//  DetailTableViewController.swift
//  InfiniteScrollCrash-Sample
//
//  Created by 구범모 on 2015. 8. 19..
//  Copyright (c) 2015년 gbmKSquare. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class DetailTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var textField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.infiniteScrollIndicatorView = Indicator(activityIndicatorStyle: .Gray)
        
        tableView.addInfiniteScrollWithHandler { (tableView) -> Void in
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))

            dispatch_after(delay, dispatch_get_main_queue(), { () -> Void in
                tableView?.finishInfiniteScroll()
            })
        }
        
        textField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        navigationItem.titleView = textField
    }
    
    deinit {
        print("DetailTableViewController.deinit")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        cell.textLabel?.text = "Scroll down and go back."
        return cell
    }
    
    // If uses [weak self] but does not implement delegate method below, it will not crash
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("Scrolled")
    }
}

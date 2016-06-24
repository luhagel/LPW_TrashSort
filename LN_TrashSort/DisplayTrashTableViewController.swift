//
//  DisplayTrashTableViewController.swift
//  LN_TrashSort
//
//  Created by Luca Hagel on 6/24/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class DisplayTrashTableViewController: UITableViewController {
    
    var allTrash = [[String]]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return allTrash[0].count
        case 1:
            return allTrash[1].count
        case 2:
            return allTrash[2].count
        default:
            return 0
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("trashCell", forIndexPath: indexPath)
        
        var array: [String] = []
        
        switch indexPath.section {
        case 0:
            array = allTrash[0]
        case 1:
            array = allTrash[1]
        case 2:
            array = allTrash[2]
        default:
            print("blah")
        }
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell")
        headerCell?.textLabel?.textColor = UIColor.whiteColor()
        headerCell?.textLabel?.backgroundColor = UIColor.blueColor()
        headerCell?.textLabel?.textAlignment = .Center
        headerCell?.textLabel?.font = UIFont.boldSystemFontOfSize(20.0)
        
        switch section {
        case 0:
            headerCell?.textLabel?.text = "Compost"
        case 1:
            headerCell?.textLabel?.text = "Recycle"
        case 2:
            headerCell?.textLabel?.text = "General"
        default:
            print("ERROR 101")
        }
        
        return headerCell
    }
}

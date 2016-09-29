

import UIKit

class RootViewController: UITableViewController {
    // MARK: - Custom Functions
    func log(tv tv: UITableView, ip: NSIndexPath, phrase: String) {
        NSLog("%@", "========")
        NSLog("%@ %@", phrase, tv.cellForRowAtIndexPath(ip)!.textLabel!.text!)
        NSLog("cell highlighted? %@", "\(tv.cellForRowAtIndexPath(ip)!.highlighted)")
        NSLog("label highlighted? %@", "\(tv.cellForRowAtIndexPath(ip)!.textLabel!.highlighted)")
    }
}


// MARK: - UITableViewDataSource
extension RootViewController {
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // we can still modify the cell as long as we fetch it from super
        let cell = super.tableView(tableView, cellForRowAtIndexPath:indexPath)
        
        // supply checkmarks as necessary
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        NSLog("about to update %@", cell.textLabel!.text!)
        
        cell.accessoryType = .None
        
        if userDefaults.valueForKey("Style") as? String == cell.textLabel!.text! ||
            userDefaults.valueForKey("Size") as? String == cell.textLabel!.text! {
            cell.accessoryType = .Checkmark
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        log(tv: tableView, ip: indexPath, phrase: "should highlight")
        
        dispatch_async(dispatch_get_main_queue(), {
            NSLog("%@", "callback from should highlight")
        })
        
        return true // try false to test this feature
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        log(tv: tableView, ip: indexPath, phrase: "did highlight")
    }
    
    override func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        log(tv: tableView, ip: indexPath, phrase: "did unhighlight")
        
        dispatch_async(dispatch_get_main_queue(), {
            NSLog("%@", "callback from did unhighlight")
        })
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        log(tv: tableView, ip: indexPath, phrase: "will select")
        
        return indexPath
    }
    
    override func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        log(tv: tableView, ip: indexPath, phrase: "will deselect")
        
        return indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        log(tv: tableView, ip: indexPath, phrase: "did select")
        
        let ud = NSUserDefaults.standardUserDefaults()
        let setting = tableView.cellForRowAtIndexPath(indexPath)!.textLabel!.text
        let header = self.tableView(tableView, titleForHeaderInSection:indexPath.section)!
        ud.setValue(setting, forKey: header)
        
        NSLog("%@", "about to reload!")
        tableView.reloadData() // deselect all cells, reassign checkmark as needed
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("did deselect %@", tableView.cellForRowAtIndexPath(indexPath)!.textLabel!.text!)
    }
    
    // just proving this stuff works even in a grouped style table
    
    /*
     
     
     override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     let v = UIView()
     v.backgroundColor = UIColor.clearColor()
     // v.backgroundColor = UIColor.yellowColor()
     // tableView.backgroundColor = UIColor.greenColor()
     return v
     }
     
     
     override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
     let v = UIView()
     v.backgroundColor = UIColor.blueColor()
     return v
     }
     
     override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     return 100
     }
     
     */
}

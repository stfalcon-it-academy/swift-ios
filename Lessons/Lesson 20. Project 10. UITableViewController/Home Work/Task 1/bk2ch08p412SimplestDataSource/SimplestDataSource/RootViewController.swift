

import UIKit

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

class RootViewController: UITableViewController {
    // MARK: - Properties
    var pep: [String]! = ["Manny", "Moe", "Jack"] // pretend model might not be ready
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // uncomment to show that the refresh control is hidden behind the background view
//        let v = UIView()
//        v.backgroundColor = UIColor.yellowColor()
//        self.tableView.backgroundView = v
    }
    
    
    // MARK: - Actions
    @IBAction func doRefresh(sender: AnyObject) {
        print("refreshing...")
        
        delay(3) {
            (sender as! UIRefreshControl).endRefreshing()
        
            print("done")
        }
    }
    
    @IBAction func doRefreshManually(sender: AnyObject) {
        self.tableView.setContentOffset(CGPointMake(0, -self.refreshControl!.bounds.height), animated: true)
        self.refreshControl!.beginRefreshing()
        self.doRefresh(self.refreshControl!)
    }
}


// MARK: - UITableViewDataSource
extension RootViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if pep == nil {
            return 0
        }
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pep.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 

        cell.textLabel!.text = pep[indexPath.row]
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension RootViewController {
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 20))
        headerView.backgroundColor = UIColor.whiteColor()
        
        return headerView
    }
}


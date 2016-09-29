
import UIKit

class RootViewController: UITableViewController {
    // MARK: - Properties
    var cells = 0
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)
        self.tableView.rowHeight = 58 // *
    }
}


// MARK: - UITableViewDataSource
extension RootViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000 // make a lot of rows this time!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as! MyCell

        let label = cell.theLabel
        
        // prove that many rows does not mean many cell objects
        label.text = "Row \(indexPath.row) of section \(indexPath.section)"
        
        if label.tag != 999 {
            label.tag = 999
        
            self.cells += 1
            print("New cell \(self.cells)")
        }
        
        let imageView = cell.theImageView
        
        // shrink apparent size of image
        let image = UIImage(named: "moi.png")!
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), true, 0.0)
        image.drawInRect(CGRectMake(0, 0, 36, 36))
        
        let imageContext = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = imageContext
        imageView.contentMode = .Center

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



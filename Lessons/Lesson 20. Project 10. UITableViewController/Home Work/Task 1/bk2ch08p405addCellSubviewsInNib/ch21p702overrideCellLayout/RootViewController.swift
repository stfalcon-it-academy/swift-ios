
import UIKit

class RootViewController: UITableViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "MyCell", bundle:nil), forCellReuseIdentifier: "Cell")
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)
    }
}


// MARK: - UITableViewDataSource
extension RootViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath)
        
        // can refer to subviews by their tags
        // subview positioning configured by constraints in the nib!
        
        let lab = cell.viewWithTag(2) as! UILabel
        lab.text = "The author of this book, who would rather be out dirt biking"
        
        let imageView = cell.viewWithTag(1) as! UIImageView
       
        // shrink apparent size of image
        let image1 = UIImage(named: "moi.png")!
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), true, 0.0)
        image1.drawInRect(CGRectMake(0, 0, 36, 36))
        
        let image2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = image2
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


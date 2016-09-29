
import UIKit

class RootViewController: UITableViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
    
    /*
     As promised, the cell will never be nil and doesn't need to be an Optional.
     But we must find another test to decide whether initial configuration is needed
     (i.e. is this a blank empty new cell or is it reused, so that it was configured
     in a previous call to cellForRow).
     */
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath)
       
        if cell.viewWithTag(1) == nil {
            let imageView = UIImageView()
            imageView.tag = 1
            cell.contentView.addSubview(imageView)
            
            let label = UILabel()
            label.tag = 2
            cell.contentView.addSubview(label)
            
            // since we are now adding the views ourselves (not reusing the default views),
            // we can use autolayout to lay them out
            
            let d = ["imageView": imageView, "label": label]
            imageView.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            var con = [NSLayoutConstraint]()
            
            // image view is vertically centered
            con.append(imageView.centerYAnchor.constraintEqualToAnchor(cell.contentView.centerYAnchor))
            
            // it's a square
            con.append(imageView.widthAnchor.constraintEqualToAnchor(imageView.heightAnchor))
            
            // label has height pinned to superview
            con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options:[], metrics: nil, views: d))
            
            // horizontal margins
            con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[label]-15-[imageView]-15-|", options:[], metrics: nil, views: d))
            NSLayoutConstraint.activateConstraints(con)
            
            label.font = UIFont(name: "Helvetica-Bold", size: 16)
            label.lineBreakMode = .ByWordWrapping
            label.numberOfLines = 2
        }
        
        // can refer to subviews by their tags
        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = "The author of this book, who would rather be out dirt biking"
        
        let imageView2 = cell.viewWithTag(1) as! UIImageView
        
        // shrink apparent size of image
        let image2 = UIImage(named: "moi.png")!
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), true, 0.0)
        image2.drawInRect(CGRectMake(0, 0, 36, 36))
        
        let imageContext2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView2.image = imageContext2
        imageView2.contentMode = .Center
        
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


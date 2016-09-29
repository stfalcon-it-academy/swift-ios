

import UIKit

class RootViewController : UITableViewController {
    // MARK: - Properties
    var sectionNames = [String]()
    var sectionData = [[String]]()
    
    
    // MARK: - Class Functions
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        let s = try! String(contentsOfFile: NSBundle.mainBundle().pathForResource("states", ofType: "txt")!, encoding: NSUTF8StringEncoding)
        let states = s.componentsSeparatedByString("\n")
        var previous = ""
        
        for aState in states {
            // get the first letter
            let c = String(aState.characters.prefix(1))
            
            // only add a letter to sectionNames when it's a different letter
            if c != previous {
                previous = c
                sectionNames.append(c.uppercaseString)
                
                // and in that case also add new subarray to our array of subarrays
                sectionData.append([String]())
            }
            
            sectionData[sectionData.count - 1].append(aState)
        }
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.registerClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
        
        tableView.sectionIndexColor = UIColor.whiteColor()
        tableView.sectionIndexBackgroundColor = UIColor.redColor()
        tableView.sectionIndexTrackingBackgroundColor = UIColor.blueColor()
        
        // not useful in this situation
        // self.tableView.separatorEffect = UIBlurEffect(style: .Dark)
    }
}


// MARK: - UITableViewDataSource
extension RootViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionNames.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionData[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let s = sectionData[indexPath.section][indexPath.row]
        cell.textLabel!.text = s
        
        // this part is not in the book, it's just for fun
        var stateName = s
        stateName = stateName.lowercaseString
        stateName = stateName.stringByReplacingOccurrencesOfString(" ", withString:"")
        stateName = "flag_\(stateName).gif"
        let image = UIImage(named: stateName)
        cell.imageView!.image = image
        
        return cell
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return self.sectionNames
    }
}


// MARK: - UITableViewDelegate
extension RootViewController {
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //return 22
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
        // return self.sectionNames[section]
    }
    
    // this is more "interesting"
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header")!
        
        if header.tintColor != UIColor.redColor() {
            print("configuring a new header view") // only called about 7 times
            
            header.tintColor = UIColor.redColor() // invisible marker, tee-hee
            header.backgroundView = UIView()
            header.backgroundView?.backgroundColor = UIColor.blackColor()
            
            let label = UILabel()
            label.tag = 1
            label.font = UIFont(name: "Georgia-Bold", size: 22)
            label.textColor = UIColor.greenColor()
            label.backgroundColor = UIColor.clearColor()
            
            header.contentView.addSubview(label)
            
            let imageView = UIImageView()
            imageView.tag = 2
            imageView.backgroundColor = UIColor.blackColor()
            imageView.image = UIImage(named: "us_flag_small.gif")
            header.contentView.addSubview(imageView)
            label.translatesAutoresizingMaskIntoConstraints = false
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activateConstraints([
                NSLayoutConstraint.constraintsWithVisualFormat("H:|-5-[label(25)]-10-[imageView(40)]", options: [], metrics: nil, views:["imageView": imageView, "label": label]),
                NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|", options: [], metrics: nil, views:["imageView": imageView]),
                NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: [], metrics: nil, views:["label": label])].flatten().map{$0})
            
            // uncomment to see bug where button does not inherit superview's tint color
            //            let b = UIButton(type:.System)
            //            b.setTitle("Howdy", forState:.Normal)
            //            b.sizeToFit()
            //            print(b.tintColor)
            //            h.addSubview(b)
        }
        
        let label = header.contentView.viewWithTag(1) as! UILabel
        label.text = self.sectionNames[section]
        
        return header
    }
}


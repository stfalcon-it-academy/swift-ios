
import UIKit

class RootViewController : UITableViewController {
    // MARK: - Properties
    let cellIdentifier = "Cell"
}

// window background is white
// table view background is green (set in nib)

/*
 the window background never appears
 the table view background appears when you "bounce" the scroll beyond its limits
 the red cell background color is behind the cell
 the linen cell background view is on top of that
 the (translucent, here) selected background view is on top of that
 the content view and its contents are on top of that
 */

/*
 Simple "dequeue" (without "forIndexPath") might return a nil cell, and certainly will at the
 outset as the initial stack of reusable cells is needed. This means that everything in the code
 has to accommodate this possibility: the cell must be a var because you might need to create
 and assign it, the cell must be typed as an Optional, and all references to the cell must be
 unwrapped. This is annoying - and completely unnecessary. I'm only showing it here
 for illustrative purposes. For the rest of the book, I'll use dequeue...:forIndexPath: which
 has none of those issues, and the cell will never be an Optional (or nil) ever again.
 */


// MARK: - UITableViewDataSource
extension RootViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
            
            cell.textLabel!.textColor = UIColor.whiteColor()
            
            let backgroundImageView = UIImageView() // no need to set frame
            backgroundImageView.contentMode = .ScaleToFill
            backgroundImageView.image = UIImage(named: "linen.png")
            cell.backgroundView = backgroundImageView
            
            let backgroundImageViewSelected = UIView() // no need to set frame
            backgroundImageViewSelected.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.2)
            cell.selectedBackgroundView = backgroundImageViewSelected
            
            // next line no longer necessary in iOS 7!
            // cell.textLabel.backgroundColor = UIColor.clearColor()
            
            // next line didn't work until iOS 7!
            cell.backgroundColor = UIColor.redColor()
        }
        
        cell.textLabel!.text = "Hello there! \(indexPath.row)"
        
        return cell
    }
}
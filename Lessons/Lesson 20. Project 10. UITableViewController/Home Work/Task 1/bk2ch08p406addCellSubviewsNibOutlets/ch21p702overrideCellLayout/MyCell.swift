

import UIKit

// cell subclass exists solely so that we can pick up subviews by name instead of tag number

class MyCell : UITableViewCell {
    // MARK: - Properties
    @IBOutlet var theLabel : UILabel!
    @IBOutlet var theImageView : UIImageView!
}


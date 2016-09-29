

import UIKit

/*
The bug with transform view animations is also gone in iOS 8!

In iOS 7 and before,
the first view jumps to the side when we perform our scale animation.
The workaround is commented out:
The second view is configured the same way; we prevent it from jumping
by taking it out of the influence of autolayout, which is hardly satisfactory.
For one thing, we get a complaint from the autolayout system...
...unless we also temporarily remove the second view's internal constraints.
*/

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    var constraints: [NSLayoutConstraint]!
    
    
    // MARK: - Class Functions
    override func viewDidLoad()  {
        super.viewDidLoad()
    }
    
    
    // MARK: - Actions
    @IBAction func doTest(sender: AnyObject?) {
        UIView.animateWithDuration(0.4, delay: 0, options: .Autoreverse, animations: {
            self.view1.transform = CGAffineTransformMakeScale(1.1, 1.1)
            self.view2.transform = CGAffineTransformMakeScale(1.1, 1.1)
            }, completion: { _ in
                self.view1.transform = CGAffineTransformIdentity
                self.view2.transform = CGAffineTransformIdentity
            })
    }
}


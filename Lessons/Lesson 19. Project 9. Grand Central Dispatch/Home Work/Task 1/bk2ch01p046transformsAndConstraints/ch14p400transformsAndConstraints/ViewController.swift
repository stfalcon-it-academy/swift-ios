

import UIKit

/*
Well, here's something I didn't expect to see: they've fixed the view transform bug!
The first view, which is constrained by its frame origin, transforms correctly in iOS 8!
Try it in iOS 7 and you'll see what the problem used to be ever since iOS 5
(the problem which the other views are demonstrating various ways to solve).

Logging reveals that the fix was exactly as I have been saying all these years:
applying the view transform no longer triggers layout in iOS 8
(neither updateConstraints on the view nor layoutSubviews on its superview is called).
Moreover, it appears that constraints are now used to calculate and set
a view's center and bounds, not its frame, as they should have been all along.
*/

class ViewController : UIViewController {
    // MARK: - Properties
    @IBOutlet var noConstraintsView : UIView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.noConstraintsView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    // MARK: - Actions
    @IBAction func doButton(gesture: UIGestureRecognizer) {
        let gesturePoint = gesture.locationInView(gesture.view)
        
        if let view = gesture.view!.hitTest(gesturePoint, withEvent: nil) {
            if view == gesture.view { return }
            if view is MyView { return }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.grow(view)
            }
        }
    }
    
    @IBAction func growLayer(gesture: UIGestureRecognizer) {
        print("growLayer")
        
        let view = gesture.view!
        view.layer.transform = CATransform3DScale(view.layer.transform, 1.2, 1.2, 1)
    }

    
    // MARK: - Custom Functions
    func grow(view: UIView) {
        print("grow \(view)")
        
        view.transform = CGAffineTransformScale(view.transform, 1.2, 1.2)
    }
}


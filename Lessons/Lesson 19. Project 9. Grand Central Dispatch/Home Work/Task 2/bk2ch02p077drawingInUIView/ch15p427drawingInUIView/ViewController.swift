
import UIKit

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

class ViewController : UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userView = MyView()
        self.view.addSubview(userView)
        
        userView.translatesAutoresizingMaskIntoConstraints = false
        
        userView.superview!.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-25-[v]-25-|", options: [], metrics: nil, views: ["v": userView])
        )
        
        userView.superview!.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat("V:[v(150)]", options: [], metrics: nil, views: ["v": userView])
        )
        
        userView.superview!.addConstraint(
            NSLayoutConstraint(item: userView, attribute: .CenterY, relatedBy: .Equal, toItem: userView.superview, attribute: .CenterY, multiplier: 1, constant: 0)
        )
        
        // comment out to experiment with resizing
        return;
        
//        delay(0.1) {
//            userView.bounds.size.height *= 2
//        }
    }
}

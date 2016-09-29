
import UIKit

class ViewController : UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userView = MyView(frame: CGRectZero)
        self.view.addSubview(userView)
        userView.translatesAutoresizingMaskIntoConstraints = false
        
        userView.superview!.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-25-[v(100)]", options: [], metrics: nil, views: ["v": userView])
        )
        
        userView.superview!.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat("V:[v(100)]", options: [], metrics: nil, views: ["v": userView])
        )
        
        userView.superview!.addConstraint(
            NSLayoutConstraint(item: userView, attribute: .CenterY, relatedBy: .Equal, toItem: userView.superview, attribute: .CenterY, multiplier: 1, constant: 0)
        )
    }
}

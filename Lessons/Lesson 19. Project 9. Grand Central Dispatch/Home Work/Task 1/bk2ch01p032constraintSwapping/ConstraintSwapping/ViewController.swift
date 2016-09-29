

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var redView: UIView!
    var yellowView: UIView!
    var blueView: UIView!
   
    var constraintsWith = [NSLayoutConstraint]()
    var constraintsWithout = [NSLayoutConstraint]()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainview = self.view
        
        let redView = UIView()
        redView.backgroundColor = UIColor.redColor()
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellowColor()
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        mainview.addSubview(redView)
        mainview.addSubview(yellowView)
        mainview.addSubview(blueView)
        
        self.redView = redView
        self.yellowView = yellowView
        self.blueView = blueView
        
        
        // construct constraints
        let c1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[v(100)]", options: [], metrics: nil, views: ["v": redView])
        let c2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[v(100)]", options: [], metrics: nil, views: ["v": yellowView])
        let c3 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[v(100)]", options: [], metrics: nil, views: ["v": blueView])
        let c4 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(100)-[v(20)]", options: [], metrics: nil, views: ["v": redView])
        let c5with = NSLayoutConstraint.constraintsWithVisualFormat("V:[redView]-(20)-[yellowView(20)]-(20)-[blueView(20)]", options: [], metrics: nil, views: ["redView": redView, "yellowView": yellowView, "blueView": blueView])
        let c5without = NSLayoutConstraint.constraintsWithVisualFormat("V:[redView]-(20)-[blueView(20)]", options: [], metrics: nil, views: ["redView": redView, "blueView": blueView])
        
        
        // first set of constraints
        self.constraintsWith.appendContentsOf(c1)
        self.constraintsWith.appendContentsOf(c2)
        self.constraintsWith.appendContentsOf(c3)
        self.constraintsWith.appendContentsOf(c4)
        self.constraintsWith.appendContentsOf(c5with)
        
        
        // second set of constraints
        self.constraintsWithout.appendContentsOf(c1)
        self.constraintsWithout.appendContentsOf(c3)
        self.constraintsWithout.appendContentsOf(c4)
        self.constraintsWithout.appendContentsOf(c5without)

        // apply first set
        NSLayoutConstraint.activateConstraints(self.constraintsWith)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent:event)
        
        print("here")
    }
    

    // MARK: - Actions
    @IBAction func handlerSwapButtonTap(sender: UIButton) {
        let mainview = self.view
        
        if self.yellowView.superview != nil {
            self.yellowView.removeFromSuperview()
            NSLayoutConstraint.deactivateConstraints(self.constraintsWith)
            NSLayoutConstraint.activateConstraints(self.constraintsWithout)
        } else {
            mainview.addSubview(yellowView)
            NSLayoutConstraint.deactivateConstraints(self.constraintsWithout)
            NSLayoutConstraint.activateConstraints(self.constraintsWith)
        }
    }
}


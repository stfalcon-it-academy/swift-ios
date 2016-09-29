
import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var didSetup = false
    
    
    // MARK: - Class Functions
    override func viewDidLayoutSubviews() {
        if self.didSetup {return}
        self.didSetup = true
        
        let mainView = self.view
        
        let customView = UIView()
        customView.backgroundColor = UIColor.redColor()
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(customView)
        
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[customView]-(0)-|", options: [], metrics: nil, views: ["customView": customView]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[customView]-(0)-|", options: [], metrics: nil, views: ["customView": customView])
            ].flatten().map{$0})
        
        // experiment by commenting out this line
        customView.preservesSuperviewLayoutMargins = true
        
        let greenView = UIView()
        greenView.backgroundColor = UIColor.greenColor()
        greenView.translatesAutoresizingMaskIntoConstraints = false
        customView.addSubview(greenView)
        
        var which: Int {return 3}
        
        switch which {
        case 1:
            // no longer need delayed performance here
            NSLayoutConstraint.activateConstraints([
                NSLayoutConstraint.constraintsWithVisualFormat("H:|-[greenView]-|", options: [], metrics: nil, views: ["greenView": greenView]),
                NSLayoutConstraint.constraintsWithVisualFormat("V:|-[greenView]-|", options: [], metrics: nil, views: ["greenView": greenView])
                ].flatten().map{$0})
            
        case 2:
            // new notation treats margins as a pseudoview (UILayoutGuide)
            NSLayoutConstraint.activateConstraints([
                greenView.topAnchor.constraintEqualToAnchor(customView.layoutMarginsGuide.topAnchor),
                greenView.bottomAnchor.constraintEqualToAnchor(customView.layoutMarginsGuide.bottomAnchor),
                greenView.trailingAnchor.constraintEqualToAnchor(customView.layoutMarginsGuide.trailingAnchor),
                greenView.leadingAnchor.constraintEqualToAnchor(customView.layoutMarginsGuide.leadingAnchor)
                ])
            
        case 3:
            // new kind of margin, "readable content"
            // particularly dramatic on iPad in landscape
            NSLayoutConstraint.activateConstraints([
                greenView.topAnchor.constraintEqualToAnchor(customView.readableContentGuide.topAnchor),
                greenView.bottomAnchor.constraintEqualToAnchor(customView.readableContentGuide.bottomAnchor),
                greenView.trailingAnchor.constraintEqualToAnchor(customView.readableContentGuide.trailingAnchor),
                greenView.leadingAnchor.constraintEqualToAnchor(customView.readableContentGuide.leadingAnchor)
                ])
            
        default:break
        }
    }
}


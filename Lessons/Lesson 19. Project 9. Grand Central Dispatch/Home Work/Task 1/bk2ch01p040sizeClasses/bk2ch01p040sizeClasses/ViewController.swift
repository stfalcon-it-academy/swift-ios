import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var label: UILabel!
    
    @IBOutlet weak var con1: NSLayoutConstraint!
    @IBOutlet weak var con2: NSLayoutConstraint!

    
    // MARK: - Class Functions
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        print("trait collection did change")
        
        let traitCollection = self.traitCollection
        print(traitCollection)
        
        if traitCollection.horizontalSizeClass == .Regular {
            print("regular")
        
            if self.con1 != nil {
                print("changing constraints")
            
                NSLayoutConstraint.deactivateConstraints([self.con1, self.con2])
                NSLayoutConstraint.activateConstraints([
                    NSLayoutConstraint.constraintsWithVisualFormat("V:[tg]-[lab]", options: [], metrics: nil, views: ["tg": self.topLayoutGuide, "lab": self.label]),
                    [self.label.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)]
                    ].flatten().map{$0})
                
                let labelSize = self.label.font.pointSize * 2
                self.label.font = self.label.font.fontWithSize(labelSize)
            }
        }
    }
}


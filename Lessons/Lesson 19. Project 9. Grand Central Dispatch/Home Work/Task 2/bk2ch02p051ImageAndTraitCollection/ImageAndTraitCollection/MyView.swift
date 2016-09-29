

import UIKit

class MyView: UIView {
    // MARK: - Properties
    var image : UIImage!
    
    
    // MARK: - Class Functions
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        self.setNeedsDisplay() // causes drawRect to be called
    }
    
    override func drawRect(rect: CGRect) {
        if var image = self.image {
            if let asset = self.image.imageAsset {
                let traitCollection = self.traitCollection
                image = asset.imageWithTraitCollection(traitCollection)
            }
            
            image.drawAtPoint(CGPointZero)
        }
    }
}


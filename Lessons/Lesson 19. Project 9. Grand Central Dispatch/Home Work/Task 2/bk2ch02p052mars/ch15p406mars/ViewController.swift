import UIKit

extension CGRect {
    var center: CGPoint {
        return CGPointMake(self.midX, self.midY)
    }
}

func delay(delay: Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}



class ViewController: UIViewController {
    // MARK: - Properties
    let which = 1

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainView = self.view
        
        let imageView = UIImageView(image: UIImage(named:"Mars"))   // asset catalog
        mainView.addSubview(imageView)
        
        imageView.clipsToBounds = true              // default is false... though this won't matter unless you also play with the content mode
        imageView.contentMode = .ScaleAspectFit     // default is .ScaleToFill... which fits but doesn't preserve aspect
        
        // just to clarify boundaries of image view
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        imageView.layer.borderWidth = 2
        
        switch which {
        case 1:
            // position using autoresizing-type behavior
            imageView.center = imageView.superview!.bounds.center   // see above
            imageView.frame.makeIntegralInPlace()
        
        case 2:
            // position using constraints
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activateConstraints([
                imageView.centerXAnchor.constraintEqualToAnchor(imageView.superview!.centerXAnchor),
                imageView.centerYAnchor.constraintEqualToAnchor(imageView.superview!.centerYAnchor)
                ])
        
        default: break
        }
        
        // showing what happens when a different image is assigned
        delay (2) {
            imageView.image = UIImage(named:"bottle5.png")
            // if we're using constraints...
            // the image view is resized, because setting the image changes the intrinsic content size
        }
    }
}


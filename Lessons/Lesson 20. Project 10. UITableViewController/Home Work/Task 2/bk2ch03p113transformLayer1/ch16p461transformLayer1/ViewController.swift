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
    // MARK: - Properties
    @IBOutlet var userView: UIView!
    
    let which = 2

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var layer1 = CALayer()
        
        switch which {
        case 1: break
        
        case 2:
            layer1 = CATransformLayer()
        
        default: break
        }
        
        layer1.frame = self.userView.layer.bounds
        self.userView.layer.addSublayer(layer1)
        
        let f = CGRectMake(0, 0, 100, 100)
        
        let layer2 = CALayer()
        layer2.frame = f
        layer2.backgroundColor = UIColor.blueColor().CGColor
        layer1.addSublayer(layer2)
        
        let layer3 = CALayer()
        layer3.frame = f.offsetBy(dx: 20, dy: 30)
        layer3.backgroundColor = UIColor.greenColor().CGColor
        layer3.zPosition = 10
        layer1.addSublayer(layer3)

        delay(2) {
            layer1.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 1, 0)
        }
    }
}

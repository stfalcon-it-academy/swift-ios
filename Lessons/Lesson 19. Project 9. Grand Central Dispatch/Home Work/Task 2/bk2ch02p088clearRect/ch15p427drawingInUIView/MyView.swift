
import UIKit

class MyView : UIView {
    // MARK: - Initialization
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        self.opaque = false
        self.backgroundColor = UIColor.redColor()
       
        // clearRect will cause a black square
        self.backgroundColor = self.backgroundColor!.colorWithAlphaComponent(1)
        
        // but uncomment the next line: clearRect will cause a clear square!
        // self.backgroundColor = self.backgroundColor!.colorWithAlphaComponent(0.99)
        
        print("Layer opaque: \(self.layer.opaque)")
    }
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    // MARK: - Class Functions
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextFillRect(context, rect)
        CGContextClearRect(context, CGRectMake(0, 0, 30, 30))
    }
}
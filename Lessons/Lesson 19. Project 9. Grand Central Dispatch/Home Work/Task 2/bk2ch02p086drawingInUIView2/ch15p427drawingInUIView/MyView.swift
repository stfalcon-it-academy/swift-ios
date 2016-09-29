
import UIKit

class MyView : UIView {
    // MARK: - Properties
    lazy var arrow : UIImage = self.arrowImage()
    
    
    // MARK: - Initialization
    override init (frame:CGRect) {
        super.init(frame:frame)
       
        self.opaque = false
    }

    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    // MARK: - Custom Functions
    func arrowImage () -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(40, 100), false, 0.0)
        
        // obtain the current graphics context
        let context = UIGraphicsGetCurrentContext()!
        CGContextSaveGState(context)
        
        // punch triangular hole in context clipping region
        CGContextMoveToPoint(context, 10, 100)
        CGContextAddLineToPoint(context, 20, 90)
        CGContextAddLineToPoint(context, 30, 100)
        CGContextClosePath(context)
        CGContextAddRect(context, CGContextGetClipBoundingBox(context))
        CGContextEOClip(context)
        
        // draw the vertical line, add its shape to the clipping region
        CGContextMoveToPoint(context, 20, 100)
        CGContextAddLineToPoint(context, 20, 19)
        CGContextSetLineWidth(context, 20)
        CGContextReplacePathWithStrokedPath(context)
        CGContextClip(context)
        
        // draw the gradient
        let locs : [CGFloat] = [ 0.0, 0.5, 1.0 ]
        let colors : [CGFloat] = [
            0.8, 0.4, // starting color, transparent light gray
            0.1, 0.5, // intermediate color, darker less transparent gray
            0.8, 0.4, // ending color, transparent light gray
        ]
        
        let sp = CGColorSpaceCreateDeviceGray()
        let grad = CGGradientCreateWithColorComponents (sp, colors, locs, 3)
        CGContextDrawLinearGradient(context, grad, CGPointMake(9, 0), CGPointMake(31, 0), [])
        
        CGContextRestoreGState(context) // done clipping
        
        // draw the red triangle, the point of the arrow
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(4, 4), false, 0)
        let imcon = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(imcon, UIColor.redColor().CGColor)
        CGContextFillRect(imcon, CGRectMake(0, 0, 4, 4))
        CGContextSetFillColorWithColor(imcon, UIColor.blueColor().CGColor)
        CGContextFillRect(imcon, CGRectMake(0, 0, 4, 2))
        let stripes = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let stripesPattern = UIColor(patternImage:stripes)
        stripesPattern.setFill()
        let p = UIBezierPath()
        p.moveToPoint(CGPointMake(0, 25))
        p.addLineToPoint(CGPointMake(20, 0))
        p.addLineToPoint(CGPointMake(40, 25))
        p.fill()
        
        let imageContext = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageContext
    }
    
    let which = 2

    override func drawRect(rect: CGRect) {
        switch which {
        case 1:
            let context = UIGraphicsGetCurrentContext()!
            self.arrow.drawAtPoint(CGPointMake(0, 0))
            
            for _ in 0..<3 {
                CGContextTranslateCTM(context, 20, 100)
                CGContextRotateCTM(context, 30 * CGFloat(M_PI) / 180.0)
                CGContextTranslateCTM(context, -20, -100)
                self.arrow.drawAtPoint(CGPointMake(0,0))
            }
            
        case 2:
            let context = UIGraphicsGetCurrentContext()!
            CGContextSetShadow(context, CGSizeMake(7, 7), 12)
            
            self.arrow.drawAtPoint(CGPointMake(0, 0))
            
            for _ in 0..<3 {
                CGContextTranslateCTM(context, 20, 100)
                CGContextRotateCTM(context, 30 * CGFloat(M_PI) / 180.0)
                CGContextTranslateCTM(context, -20, -100)
                self.arrow.drawAtPoint(CGPointMake(0, 0))
            }
            
        case 3:
            let context = UIGraphicsGetCurrentContext()!
            CGContextSetShadow(context, CGSizeMake(7, 7), 12)
            
            CGContextBeginTransparencyLayer(context, nil)
            self.arrow.drawAtPoint(CGPointMake(0, 0))
            
            for _ in 0..<3 {
                CGContextTranslateCTM(context, 20, 100)
                CGContextRotateCTM(context, 30 * CGFloat(M_PI) / 180.0)
                CGContextTranslateCTM(context, -20, -100)
                self.arrow.drawAtPoint(CGPointMake(0, 0))
            }
            
            CGContextEndTransparencyLayer(context)

        default: break
        }
    }
}


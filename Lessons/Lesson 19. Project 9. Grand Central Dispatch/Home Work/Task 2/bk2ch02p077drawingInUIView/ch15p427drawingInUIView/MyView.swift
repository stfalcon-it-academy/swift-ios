
import UIKit

class MyView: UIView {
    // MARK: - Initialization
    init() {
        super.init(frame:CGRectZero)
        self.opaque = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.opaque = false
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.opaque = false
    }
    
    
    // MARK: - Properties
    let which = 1
    
    
    // MARK: - Class Functions
    override func drawRect(rect: CGRect) {
        switch which {
        case 1:
            let context = UIGraphicsGetCurrentContext()!
            
            // draw a black (by default) vertical line, the shaft of the arrow
            CGContextMoveToPoint(context, 100, 100)
            CGContextAddLineToPoint(context, 100, 19)
            CGContextSetLineWidth(context, 20)
            CGContextStrokePath(context)
            
            // draw a red triangle, the point of the arrow
            CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
            CGContextMoveToPoint(context, 80, 25)
            CGContextAddLineToPoint(context, 100, 0)
            CGContextAddLineToPoint(context, 120, 25)
            CGContextFillPath(context)
            
            // snip a triangle out of the shaft by drawing in Clear blend mode
            CGContextMoveToPoint(context, 90, 101)
            CGContextAddLineToPoint(context, 100, 90)
            CGContextAddLineToPoint(context, 110, 101)
            CGContextSetBlendMode(context, .Clear)
            CGContextFillPath(context)
            
        case 2:
            let drawPath = UIBezierPath()
            drawPath.moveToPoint(CGPointMake(100, 100))
            drawPath.addLineToPoint(CGPointMake(100, 19))
            drawPath.lineWidth = 20
            drawPath.stroke()
            
            UIColor.redColor().set()
            drawPath.removeAllPoints()
            drawPath.moveToPoint(CGPointMake(80, 25))
            drawPath.addLineToPoint(CGPointMake(100, 0))
            drawPath.addLineToPoint(CGPointMake(120, 25))
            drawPath.fill()
            
            drawPath.removeAllPoints()
            drawPath.moveToPoint(CGPointMake(90, 101))
            drawPath.addLineToPoint(CGPointMake(100, 90))
            drawPath.addLineToPoint(CGPointMake(110, 101))
            drawPath.fillWithBlendMode(.Clear, alpha: 1.0)
            
        case 3:
            // obtain the current graphics context
            let context = UIGraphicsGetCurrentContext()!
            
            // punch triangular hole in context clipping region
            CGContextMoveToPoint(context, 90, 100)
            CGContextAddLineToPoint(context, 100, 90)
            CGContextAddLineToPoint(context, 110, 100)
            CGContextClosePath(context)
            CGContextAddRect(context, CGContextGetClipBoundingBox(context))
            CGContextEOClip(context)
            
            // draw the vertical line
            CGContextMoveToPoint(context, 100, 100)
            CGContextAddLineToPoint(context, 100, 19)
            CGContextSetLineWidth(context, 20)
            CGContextStrokePath(context)
            
            // draw the red triangle, the point of the arrow
            CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
            CGContextMoveToPoint(context, 80, 25)
            CGContextAddLineToPoint(context, 100, 0)
            CGContextAddLineToPoint(context, 120, 25)
            CGContextFillPath(context)
            
        case 4:
            // obtain the current graphics context
            let context = UIGraphicsGetCurrentContext()!
            CGContextSaveGState(context)
            
            // punch triangular hole in context clipping region
            CGContextMoveToPoint(context, 90, 100)
            CGContextAddLineToPoint(context, 100, 90)
            CGContextAddLineToPoint(context, 110, 100)
            CGContextClosePath(context)
            CGContextAddRect(context, CGContextGetClipBoundingBox(context))
            CGContextEOClip(context)
            
            // draw the vertical line, add its shape to the clipping region
            CGContextMoveToPoint(context, 100, 100)
            CGContextAddLineToPoint(context, 100, 19)
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
            CGContextDrawLinearGradient (context, grad, CGPointMake(89, 0), CGPointMake(111, 0), [])
            
            CGContextRestoreGState(context)     // done clipping
            
            // draw the red triangle, the point of the arrow
            CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
            CGContextMoveToPoint(context, 80, 25)
            CGContextAddLineToPoint(context, 100, 0)
            CGContextAddLineToPoint(context, 120, 25)
            CGContextFillPath(context)
            
        case 5:
            // obtain the current graphics context
            let context = UIGraphicsGetCurrentContext()!
            CGContextSaveGState(context)
            
            // punch triangular hole in context clipping region
            CGContextMoveToPoint(context, 90, 100)
            CGContextAddLineToPoint(context, 100, 90)
            CGContextAddLineToPoint(context, 110, 100)
            CGContextClosePath(context)
            CGContextAddRect(context, CGContextGetClipBoundingBox(context))
            CGContextEOClip(context)
            
            // draw the vertical line, add its shape to the clipping region
            CGContextMoveToPoint(context, 100, 100)
            CGContextAddLineToPoint(context, 100, 19)
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
            CGContextDrawLinearGradient(context, grad, CGPointMake(89, 0), CGPointMake(111, 0), [])
            
            CGContextRestoreGState(context)     // done clipping
            
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
            
            let drawPath = UIBezierPath()
            drawPath.moveToPoint(CGPointMake(80, 25))
            drawPath.addLineToPoint(CGPointMake(100, 0))
            drawPath.addLineToPoint(CGPointMake(120, 25))
            drawPath.fill()
            
        case 6:
            // obtain the current graphics context
            let context = UIGraphicsGetCurrentContext()!
            CGContextSaveGState(context)
            
            // punch triangular hole in context clipping region
            CGContextMoveToPoint(context, 90, 100)
            CGContextAddLineToPoint(context, 100, 90)
            CGContextAddLineToPoint(context, 110, 100)
            CGContextClosePath(context)
            CGContextAddRect(context, CGContextGetClipBoundingBox(context))
            CGContextEOClip(context)
            
            // draw the vertical line, add its shape to the clipping region
            CGContextMoveToPoint(context, 100, 100)
            CGContextAddLineToPoint(context, 100, 19)
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
            CGContextDrawLinearGradient(context, grad, CGPointMake(89, 0), CGPointMake(111, 0), [])
            
            CGContextRestoreGState(context)     // done clipping
            
            // draw the red triangle, the point of the arrow
            let sp2 = CGColorSpaceCreatePattern(nil)
            CGContextSetFillColorSpace(context, sp2)
            
            // hooray for Swift 2.0!
            let drawStripes : CGPatternDrawPatternCallback = { _, context in
                CGContextSetFillColorWithColor(context!, UIColor.redColor().CGColor)
                CGContextFillRect(context!, CGRectMake(0,0,4,4))
                CGContextSetFillColorWithColor(context!, UIColor.blueColor().CGColor)
                CGContextFillRect(context!, CGRectMake(0,0,4,2))
            }
            
            var callbacks = CGPatternCallbacks(version: 0, drawPattern: drawStripes, releaseInfo: nil)
            let patt = CGPatternCreate(nil, CGRectMake(0, 0, 4, 4),
                CGAffineTransformIdentity, 4, 4,
                .ConstantSpacingMinimalDistortion,
                true, &callbacks)
            
            var alph : CGFloat = 1.0
            CGContextSetFillPattern(context, patt, &alph)
            

            CGContextMoveToPoint(context, 80, 25)
            CGContextAddLineToPoint(context, 100, 0)
            CGContextAddLineToPoint(context, 120, 25)
            CGContextFillPath(context)
            
        default: break
        }
    }
}


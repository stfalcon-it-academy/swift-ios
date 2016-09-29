import UIKit


class MyView1: UIView {
    // MARK: - Class Functions
    override func drawRect(rect: CGRect) {
        let drawPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
        UIColor.blueColor().setFill()
        drawPath.fill()
    }
}

class MyView2: UIView {
    // MARK: - Class Functions
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100))
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextFillPath(context)
    }
}

class MyView3: UIView {
    // MARK: - Class Functions
    override func drawRect(rect: CGRect) {}

    override func drawLayer(layer: CALayer, inContext context: CGContext) {
        UIGraphicsPushContext(context)
        let drawPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
        UIColor.blueColor().setFill()
        drawPath.fill()
        UIGraphicsPopContext()
    }
}

class MyView4: UIView {
    // MARK: - Class Functions
    override func drawRect(rect: CGRect) {}

    override func drawLayer(layer: CALayer, inContext context: CGContext) {
        CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100))
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextFillPath(context)
    }
}

class MyImageView1: UIImageView {
    // MARK: - Class Functions
    override func awakeFromNib() {
        super.awakeFromNib()

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), false, 0)
        let drawPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
        UIColor.blueColor().setFill()
        drawPath.fill()
        
        let imageContext = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.image = imageContext
    }
}

class MyImageView2: UIImageView {
    // MARK: - Class Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.image = imageOfSize(CGSizeMake(100, 100)) {
            let context = UIGraphicsGetCurrentContext()!
            CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100))
            CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
            CGContextFillPath(context)
        }
    }
}

/*
NOTE: This structured dance is boring, distracting, confusing (when reading), and error-prone:

UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,100), false, 0)
// do stuff
let im = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

Since the purpose is to extract the image, it would be nice to replace that with a functional architecture that clearly yields the image. Moreover, such an architecture has the advantage of isolating any local variables used within the "sandwich". In Objective-C you can at least wrap the interior in curly braces to form a scope, but Swift, with its easy closure formation, offers the opportunity for an even clearer presentation, along these lines:
*/

func imageOfSize(size: CGSize, _ opaque: Bool = false, _ closure:() -> ()) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, opaque, 0)
    closure()
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return result
}


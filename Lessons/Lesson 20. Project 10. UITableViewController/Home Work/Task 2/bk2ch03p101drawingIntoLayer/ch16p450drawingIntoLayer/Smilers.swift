

import UIKit


class Smiler: NSObject {
    // MARK: - Class Functions
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        UIImage(named: "smiley")!.drawAtPoint(CGPoint())
        UIGraphicsPopContext()
        
        print("\(#function)")
        print(layer.contentsGravity)
    }
}

class Smiler2: NSObject {
    override func displayLayer(layer: CALayer) {
        layer.contents = UIImage(named: "smiley")!.CGImage
       
        print("\(#function)")
        print(layer.contentsGravity)
    }
}

class SmilerLayer: CALayer {
    override func drawInContext(ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        UIImage(named: "smiley")!.drawAtPoint(CGPoint())
        UIGraphicsPopContext()

        print("\(#function)")
        print(self.contentsGravity)
    }
}

class SmilerLayer2: CALayer {
    override func display() {
        self.contents = UIImage(named: "smiley")!.CGImage
        
        print("\(#function)")
        print(self.contentsGravity)
    }
}

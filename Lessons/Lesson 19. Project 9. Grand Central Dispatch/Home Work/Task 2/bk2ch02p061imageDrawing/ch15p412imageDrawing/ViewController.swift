

import UIKit

class ViewController : UIViewController {
    // MARK: - Properties
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    @IBOutlet var imageView4: UIImageView!
    @IBOutlet var imageView5: UIImageView!
    @IBOutlet var imageView6: UIImageView!
    @IBOutlet var imageView7: UIImageView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // imageView1
        do {
            let imageMars = UIImage(named: "Mars")!
            let imageMarsSize = imageMars.size
            
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageMarsSize.width * 2, imageMarsSize.height), false, 0)
            imageMars.drawAtPoint(CGPointMake(0, 0))
            imageMars.drawAtPoint(CGPointMake(imageMarsSize.width, 0))
            let imageContext = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            imageView1.image = imageContext
        }
        
        // imageView2
        do {
            let imageMars = UIImage(named: "Mars")!
            let imageMarsSize = imageMars.size
            
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageMarsSize.width * 2, imageMarsSize.height * 2), false, 0)
            imageMars.drawInRect(CGRectMake(0, 0, imageMarsSize.width * 2, imageMarsSize.height * 2))
            imageMars.drawInRect(CGRectMake(imageMarsSize.width / 2.0, imageMarsSize.height / 2.0, imageMarsSize.width, imageMarsSize.height), blendMode: .Multiply, alpha: 1.0)
            let imageContext = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            imageView2.image = imageContext
        }
        
        // imageView3
        do {
            let imageMars = UIImage(named: "Mars")!
            let imageMarsSize = imageMars.size
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageMarsSize.width / 2.0, imageMarsSize.height), false, 0)
            imageMars.drawAtPoint(CGPointMake(-imageMarsSize.width / 2.0, 0))
            let imageContext = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            imageView3.image = imageContext
        }
        
        // imageView4
        do {
            let imageMars = UIImage(named: "Mars")!
            
            // extract each half as CGImage
            let imageMarsCG = imageMars.CGImage
            let imageMarsSize = imageMars.size
            let marsLeft = CGImageCreateWithImageInRect(imageMarsCG, CGRectMake(0, 0, imageMarsSize.width / 2.0, imageMarsSize.height))
            let marsRight = CGImageCreateWithImageInRect(imageMarsCG, CGRectMake(imageMarsSize.width / 2.0, 0, imageMarsSize.width / 2.0, imageMarsSize.height))
           
            // draw each CGImage
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageMarsSize.width * 1.5, imageMarsSize.height), false, 0)
            let context = UIGraphicsGetCurrentContext()!
            CGContextDrawImage(context, CGRectMake(0, 0, imageMarsSize.width / 2.0, imageMarsSize.height), marsLeft)
            CGContextDrawImage(context, CGRectMake(imageMarsSize.width, 0, imageMarsSize.width / 2.0, imageMarsSize.height), marsRight)
            let imageContext = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
          
            // no memory management
            imageView4.image = imageContext     // flipped!
        }
        
        // imageView5
        do {
            let imageMars = UIImage(named: "Mars")!
            
            // extract each half as CGImage
            let imageMarsSize = imageMars.size
            let imageMarsCG = imageMars.CGImage
            let marsLeft = CGImageCreateWithImageInRect(imageMarsCG, CGRectMake(0, 0, imageMarsSize.width / 2.0, imageMarsSize.height))
            let marsRight = CGImageCreateWithImageInRect(imageMarsCG, CGRectMake(imageMarsSize.width / 2.0, 0, imageMarsSize.width / 2.0, imageMarsSize.height))
            
            // draw each CGImage flipped
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageMarsSize.width * 1.5, imageMarsSize.height), false, 0)
            let context = UIGraphicsGetCurrentContext()!
            CGContextDrawImage(context, CGRectMake(0, 0, imageMarsSize.width / 2.0, imageMarsSize.height), flip(marsLeft!))
            CGContextDrawImage(context, CGRectMake(imageMarsSize.width, 0, imageMarsSize.width / 2.0, imageMarsSize.height), flip(marsRight!))
            let imageContext = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            // no memory management
            imageView5.image = imageContext
        }
        
        // imageView6
        do {
            let imageMars = UIImage(named: "Mars")!
            let imageMarsSize = imageMars.size
            let imageMarsCG = imageMars.CGImage
            let imageMarsSizeCG = CGSizeMake(CGFloat(CGImageGetWidth(imageMarsCG)), CGFloat(CGImageGetHeight(imageMarsCG)))
            let marsLeft = CGImageCreateWithImageInRect(imageMarsCG, CGRectMake(0, 0, imageMarsSizeCG.width / 2.0, imageMarsSizeCG.height))
            let marsRight = CGImageCreateWithImageInRect(imageMarsCG, CGRectMake(imageMarsSizeCG.width / 2.0, 0, imageMarsSizeCG.width / 2.0,imageMarsSizeCG.height))
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageMarsSize.width * 1.5, imageMarsSize.height), false, 0)
            
            // the rest as before, draw each CGImage flipped
            let context = UIGraphicsGetCurrentContext()!
            CGContextDrawImage(context, CGRectMake(0, 0, imageMarsSize.width / 2.0, imageMarsSize.height), flip(marsLeft!))
            CGContextDrawImage(context, CGRectMake(imageMarsSize.width, 0, imageMarsSize.width / 2.0, imageMarsSize.height), flip(marsRight!))
            let imageContext = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            // no memory management
            imageView6.image = imageContext
        }
        
        // imageView7
        do {
            let imageMars = UIImage(named: "Mars")!
            let imageMarsSize = imageMars.size
            let marsCG = imageMars.CGImage
            let imageMarsSizeCG = CGSizeMake(CGFloat(CGImageGetWidth(marsCG)), CGFloat(CGImageGetHeight(marsCG)))
            let marsLeft = CGImageCreateWithImageInRect(marsCG, CGRectMake(0, 0, imageMarsSizeCG.width / 2.0, imageMarsSizeCG.height))
            let marsRight = CGImageCreateWithImageInRect(marsCG, CGRectMake(imageMarsSizeCG.width / 2.0, 0, imageMarsSizeCG.width / 2.0, imageMarsSizeCG.height))
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageMarsSize.width * 1.5, imageMarsSize.height), false, 0)
            
            // instead of calling flip, pass through UIImage
            UIImage(CGImage: marsLeft!, scale: imageMars.scale, orientation: imageMars.imageOrientation).drawAtPoint(CGPointMake(0, 0))
            UIImage(CGImage: marsRight!, scale: imageMars.scale, orientation: imageMars.imageOrientation).drawAtPoint(CGPointMake(imageMarsSize.width, 0))
            let imageContext = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            // no memory management
            imageView7.image = imageContext
        }
    }
}


// MARK: - Custom Functions
func flip (image: CGImage) -> CGImage {
    let imageMarsSize = CGSizeMake(CGFloat(CGImageGetWidth(image)), CGFloat(CGImageGetHeight(image)))
    UIGraphicsBeginImageContextWithOptions(imageMarsSize, false, 0)
    CGContextDrawImage(UIGraphicsGetCurrentContext()!, CGRectMake(0, 0, imageMarsSize.width, imageMarsSize.height), image)
    let result = UIGraphicsGetImageFromCurrentImageContext().CGImage
    UIGraphicsEndImageContext()
   
    return result!
}

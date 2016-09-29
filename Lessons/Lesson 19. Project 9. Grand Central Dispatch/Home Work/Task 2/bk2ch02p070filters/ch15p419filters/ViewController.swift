
import UIKit

class ViewController : UIViewController {
    // MARK: - Properties
    @IBOutlet var imageView: UIImageView!
    let context = CIContext(options:nil)
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moi = UIImage(named: "Moi")!
        let moici = CIImage(image: moi)!
        let moiextent = moici.extent
        
        let center = CIVector(x: moiextent.width / 2.0, y: moiextent.height / 2.0)
        
        let smallerDimension = min(moiextent.width, moiextent.height)
        let largerDimension = max(moiextent.width, moiextent.height)
        
        // first filter
        let grad = CIFilter(name: "CIRadialGradient")!
        grad.setValue(center, forKey:"inputCenter")
        grad.setValue(smallerDimension / 2.0 * 0.85, forKey:"inputRadius0")
        grad.setValue(largerDimension / 2.0, forKey:"inputRadius1")
        let gradimage = grad.outputImage!
        
        // second filter
        let blendimage = moici.imageByApplyingFilter(
            "CIBlendWithMask", withInputParameters: [
                "inputMaskImage":gradimage
            ])
        
        
        // two ways to obtain final bitmap; third way, claimed to work, does not
        var which: Int { return 2 }
        
        switch which {
        case 1:
            let moicg = context.createCGImage(blendimage, fromRect: moiextent)
            
            imageView.image = UIImage(CGImage: moicg)
            
        case 2:
            UIGraphicsBeginImageContextWithOptions(moiextent.size, false, 0)
            UIImage(CIImage: blendimage).drawInRect(moiextent)
            let imageContext = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            imageView.image = imageContext
            
        case 3:
            imageView.image = UIImage(CIImage: blendimage)  // nope
            
        default: break
        }
    }
}



import UIKit


class ViewController : UIViewController {
    // MARK: - Properties
    @IBOutlet var userImageView: UIImageView!
    let context = CIContext(options: nil)
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vig = MyVignetteFilter()
        let moici = CIImage(image: UIImage(named: "Moi")!)!
        
        vig.setValuesForKeysWithDictionary([
            "inputImage":moici,
            "inputPercentage":0.7
        ])
        
        let outim = vig.outputImage!
        let outimcg = self.context.createCGImage(outim, fromRect: outim.extent)
        
        userImageView.image = UIImage(CGImage: outimcg)
    }
}


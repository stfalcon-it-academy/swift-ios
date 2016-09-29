import UIKit


class ViewController : UIViewController {
    // MARK: - Properties
    let which = 2
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainView = self.view
        
        let magentaLayer = CALayer()
        magentaLayer.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1).CGColor
        magentaLayer.frame = CGRectMake(113, 111, 132, 194)
        mainView.layer.addSublayer(magentaLayer)
        
        let greenLayer = CALayer()
        greenLayer.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1).CGColor
        greenLayer.frame = CGRectMake(41, 56, 132, 194)
        magentaLayer.addSublayer(greenLayer)
        
        switch which {
        case 1:
            let imageView = UIImageView(image:UIImage(named: "smiley"))
            mainView.addSubview(imageView)
            imageView.frame.origin = CGPointMake(180, 180)
       
        case 2:
            // a layer can have image content
            let imageLayer = CALayer()
            let image = UIImage(named: "smiley")!
            imageLayer.frame = CGRect(origin:CGPointMake(180, 180), size: image.size)
            imageLayer.contents = image.CGImage // no need to remember to cast to id
            // but you do still need to remember to take the CGImage
            // a UIImage still gets no error but no image
            mainView.layer.addSublayer(imageLayer)

        default: break
        }

        let redLayer = CALayer()
        redLayer.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor
        redLayer.frame = CGRectMake(43, 197, 160, 230)
        mainView.layer.addSublayer(redLayer)
    }
}


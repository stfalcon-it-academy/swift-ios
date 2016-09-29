

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainView = self.view
        let magentaView = UIView(frame: CGRectMake(113, 111, 132, 194))
        magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        
        let greenView = UIView(frame: CGRectMake(41, 56, 132, 194))
        greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
       
        let redView = UIView(frame: CGRectMake(43, 197, 160, 230))
        redView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        mainView.addSubview(magentaView)
        magentaView.addSubview(greenView)
        mainView.addSubview(redView)

        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
        blur.frame = mainView.bounds
        blur.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
       
        let vibrancy = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blur.effect as! UIBlurEffect))
        
        let userLabel = UILabel()
        userLabel.text = "Hello, world!"
        userLabel.sizeToFit()
        vibrancy.frame = userLabel.frame
        vibrancy.contentView.addSubview(userLabel)
        vibrancy.center = CGPointMake(blur.bounds.midX, blur.bounds.midY)
       
        vibrancy.autoresizingMask = [.FlexibleTopMargin, .FlexibleBottomMargin, .FlexibleLeftMargin, .FlexibleRightMargin]
        
        blur.contentView.addSubview(vibrancy)
        mainView.addSubview(blur)
    }
}


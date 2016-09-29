

import UIKit

@UIApplicationMain class AppDelegate : UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    let which = 2
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow()
        
        self.window!.rootViewController = UIViewController()
        let mainView = self.window!.rootViewController!.view
        
        switch which {
        case 1:
            let magentaView = UIView(frame: CGRectMake(113, 111, 132, 194))
            magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            
            let greenView = UIView(frame: magentaView.bounds.insetBy(dx: 10, dy: 10))
            greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
           
            mainView.addSubview(magentaView)
            magentaView.addSubview(greenView)
            
            magentaView.transform = CGAffineTransformMakeRotation(45 * CGFloat(M_PI) / 180.0)
            print("which = 1: \(magentaView.frame)")
            
        case 2:
            let magentaView = UIView(frame: CGRectMake(113, 111, 132, 194))
            magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            
            let greenView = UIView(frame: magentaView.bounds.insetBy(dx: 10, dy: 10))
            greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainView.addSubview(magentaView)
            magentaView.addSubview(greenView)
            
            magentaView.transform = CGAffineTransformMakeScale(1.8, 1)
            print("which = 2: \(magentaView.frame)")
            
        case 3:
            let magentaView = UIView(frame: CGRectMake(20, 111, 132, 194))
            magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            
            let greenView = UIView(frame: magentaView.bounds)
            greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            
            mainView.addSubview(magentaView)
            magentaView.addSubview(greenView)
            
            greenView.transform = CGAffineTransformMakeTranslation(100, 0)
            greenView.transform = CGAffineTransformRotate(greenView.transform, 45 * CGFloat(M_PI) / 180.0)
            print("which = 3: \(greenView.frame)")

        case 4:
            let magentaView = UIView(frame: CGRectMake(20, 111, 132, 194))
            magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            
            let greenView = UIView(frame: magentaView.bounds)
            greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            
            mainView.addSubview(magentaView)
            magentaView.addSubview(greenView)
            
            greenView.transform = CGAffineTransformMakeRotation(45 * CGFloat(M_PI) / 180.0)
            greenView.transform = CGAffineTransformTranslate(greenView.transform, 100, 0)
            print("which = 4: \(greenView.frame)")

        case 5: // same as case 4 but using concat
            let magentaView = UIView(frame: CGRectMake(20, 111, 132, 194))
            magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            
            let greenView = UIView(frame: magentaView.bounds)
            greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            
            mainView.addSubview(magentaView)
            magentaView.addSubview(greenView)
            
            let rotate = CGAffineTransformMakeRotation(45 * CGFloat(M_PI)/180.0)
            let transform = CGAffineTransformMakeTranslation(100, 0)
            greenView.transform = CGAffineTransformConcat(transform, rotate) // not r,t
            print("which = 5: \(greenView.frame)")

        case 6:
            let magentaView = UIView(frame: CGRectMake(20, 111, 132, 194))
            magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            
            let greenView = UIView(frame: magentaView.bounds)
            greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            
            mainView.addSubview(magentaView)
            magentaView.addSubview(greenView)
            
            let rotate = CGAffineTransformMakeRotation(45 * CGFloat(M_PI) / 180.0)
            let transform = CGAffineTransformMakeTranslation(100, 0)
            greenView.transform = CGAffineTransformConcat(transform, rotate)
            greenView.transform = CGAffineTransformConcat(CGAffineTransformInvert(rotate), greenView.transform)
            print("which = 6: \(greenView.frame)")

        case 7:
            let magentaView = UIView(frame: CGRectMake(113, 111, 132, 194))
            magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            
            let greenView = UIView(frame: magentaView.bounds.insetBy(dx: 10, dy: 10))
            greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            
            mainView.addSubview(magentaView)
            magentaView.addSubview(greenView)
            
            magentaView.transform = CGAffineTransformMake(1, 0, -0.2, 1, 0, 0)
            print("which = 7: \(magentaView.frame)")

        default: break
        }
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        return true
    }
}

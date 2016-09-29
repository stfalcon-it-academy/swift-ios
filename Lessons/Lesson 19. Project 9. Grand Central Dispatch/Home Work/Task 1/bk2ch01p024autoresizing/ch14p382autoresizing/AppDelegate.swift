
import UIKit

func delay(delay: Double, closure:() -> ()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}


@UIApplicationMain class AppDelegate : UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow()
        
        self.window!.rootViewController = UIViewController()
        let mainView = self.window!.rootViewController!.view
        
        let magentaView = UIView(frame:CGRectMake(100, 111, 132, 194))
        magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        
        let greenView = UIView(frame:CGRectMake(0, 0, 132, 10))
        greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        
        let redView = UIView(frame:CGRectMake(magentaView.bounds.width - 20, magentaView.bounds.height - 20, 20, 20))
        redView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        mainView.addSubview(magentaView)
        magentaView.addSubview(greenView)
        magentaView.addSubview(redView)
        
        greenView.autoresizingMask = .FlexibleWidth
        redView.autoresizingMask = [.FlexibleTopMargin, .FlexibleLeftMargin]

        delay(2) {
            print("1. greenView before  = \(greenView)")
            magentaView.bounds.size.width += 40
            print("2. greenView ater    = \(greenView)")

            print("1. redView before    = \(redView)")
            magentaView.bounds.size.height -= 50
            print("2. redView after     = \(redView)")
            
//            magentaView.frame = mainView.bounds
//            magentaView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        }
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
       
        return true
    }
}

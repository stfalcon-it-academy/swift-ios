

import UIKit

@UIApplicationMain class AppDelegate : UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow()
        
        self.window!.rootViewController = UIViewController()
        let mainView = self.window!.rootViewController!.view
        
        let magentaView = UIView(frame:CGRectMake(113, 111, 132, 194))
//        magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        magentaView.backgroundColor = UIColor.magentaColor()
        
        let greenView = UIView(frame:CGRectMake(41, 56, 132, 194))
//        greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        greenView.backgroundColor = UIColor.greenColor()
        
        let redView = UIView(frame:CGRectMake(43, 197, 160, 230))
//        redView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        redView.backgroundColor = UIColor.redColor()
        
        mainView.addSubview(magentaView)
        magentaView.addSubview(greenView)
        mainView.addSubview(redView)
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
     
        return true
    }
    
}

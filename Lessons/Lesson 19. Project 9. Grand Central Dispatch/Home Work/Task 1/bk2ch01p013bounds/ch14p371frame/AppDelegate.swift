import UIKit

@UIApplicationMain class AppDelegate : UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    let which = 3
    
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
            
        case 2:
            let magentaView = UIView(frame: CGRectMake(113, 111, 132, 194))
            magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            
            let greenView = UIView(frame: magentaView.bounds.insetBy(dx: 10, dy: 10))
            greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            
            mainView.addSubview(magentaView)
            magentaView.addSubview(greenView)
            
            greenView.bounds.size.height += 20
            greenView.bounds.size.width += 20
            
        case 3:
            let magentaView = UIView(frame: CGRectMake(113, 111, 132, 194))
            magentaView.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            
            let greenView = UIView(frame: magentaView.bounds.insetBy(dx: 10, dy: 10))
            greenView.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            
            mainView.addSubview(magentaView)
            magentaView.addSubview(greenView)
            
            magentaView.bounds.origin.x += 10
            magentaView.bounds.origin.y += 10
            
        default: break
        }
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        return true
    }
}



import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        let mainView = self.view
        let customView = UIView(frame: CGRectMake(100, 100, 50, 50))
        customView.backgroundColor = UIColor.redColor() // small red square
     
        mainView.addSubview(customView) // add it to main view
    }
}


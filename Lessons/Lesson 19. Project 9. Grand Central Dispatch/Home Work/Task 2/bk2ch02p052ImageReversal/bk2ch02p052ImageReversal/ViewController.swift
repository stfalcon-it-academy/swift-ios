

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var imageView: UIImageView!
   
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = imageView.image?.imageFlippedForRightToLeftLayoutDirection()
    }
}


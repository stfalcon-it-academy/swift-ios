
import UIKit

// there's a bug when an image view's image is set in IB and comes from the app bundle:
// the triple-resolution version is used on double-resolution devices
// otherwise, triple-resolution is confined to the triple-resolution device

// so the asset catalog version works,
// and the init(named:) versions work

// aha, further testing suggests that the bug is in `pathForResource`

// bug fixed in Xcode 6.1!

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!


    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(imageView1.image!.scale)
        
        imageView3.image = UIImage(named: "one")
        imageView4.image = UIImage(named: "uno")
        
        if let filePath = NSBundle.mainBundle().pathForResource("one", ofType: "png") {
            imageView5.image = UIImage(contentsOfFile: filePath)
        }
        
        if let filePath = NSBundle.mainBundle().pathForResource("uno", ofType: "png") {
            imageView6.image = UIImage(contentsOfFile: filePath)
        } else {
            print("looking for smiley")
            
            imageView6.image = UIImage(named: "smiley")
        }
    }
}


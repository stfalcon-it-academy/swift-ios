

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var customView: MyView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1.image = UIImage(named: "Moods")
        
        // that was cool enough, but...
        // hold my beer and watch this!
        let tcdisp = UITraitCollection(displayScale: UIScreen.mainScreen().scale)
        let tcphone = UITraitCollection(userInterfaceIdiom: .Phone)
        let tcreg = UITraitCollection(verticalSizeClass: .Regular)
        let tc1 = UITraitCollection(traitsFromCollections: [tcdisp, tcphone, tcreg])
        let tccom = UITraitCollection(verticalSizeClass: .Compact)
        let tc2 = UITraitCollection(traitsFromCollections: [tcdisp, tcphone, tccom])
        let moods = UIImageAsset()
        
        let frowney = UIImage(named: "frowney")!.imageWithRenderingMode(.AlwaysOriginal)
        let smiley = UIImage(named: "smiley")!.imageWithRenderingMode(.AlwaysOriginal)
        moods.registerImage(frowney, withTraitCollection: tc1)
        moods.registerImage(smiley, withTraitCollection: tc2)
        
        let tc = self.traitCollection
        let image = moods.imageWithTraitCollection(tc)
        imageView2.image = image
        
        customButton.setImage(image, forState: .Normal)
        customButton.setImage(image, forState: .Highlighted)
        
        customView.image = image
    }
}


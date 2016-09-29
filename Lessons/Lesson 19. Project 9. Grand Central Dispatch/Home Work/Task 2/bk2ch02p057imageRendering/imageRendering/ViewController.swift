import UIKit

class ViewController : UIViewController {
    // MARK: - Properties
    @IBOutlet var userButton: UIButton!
    @IBOutlet var userTabBarItem: UITabBarItem!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let window = UIApplication.sharedApplication().delegate!.window! {
            window.tintColor = UIColor.redColor()
        }
        
        let buttonImage = UIImage(named: "Smiley")!.imageWithRenderingMode(.AlwaysTemplate)
        userButton.setBackgroundImage(buttonImage, forState: .Normal)
        
        let itemImage = UIImage(named: "smiley2")!.imageWithRenderingMode(.AlwaysOriginal)
        userTabBarItem.image = itemImage
        
        // but with Xcode 6, this sort of thing is usually unnecessary!
        // look at the third button in the top row; it is template but with _no code_
        // that's because you can now set the rendering mode directly in the asset catalog
        
        // also demonstrated, another new Xcode 6 feature: vector art in the asset catalog! 
        // one size fits all, without rasterization
        // apparently only vector PDFs are acceptable
        
        // not demonstrated: setting alignment rectangle in asset catalog
        // (haven't figured this out yet)
        
        let image1 = UIImage(named: "photo")!.imageWithAlignmentRectInsets(UIEdgeInsetsMake(0, 0, 24, 0))
        let imageView1 = UIImageView(image: image1)
        self.view.addSubview(imageView1)
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
            imageView1.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor),
            imageView1.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor)
            ])
        
        // the previous code aligns to bottom correctly
        // now, if alignment rectangle in asset catalog were working...
        // then I should be able to make the same setting in the asset catalog
        // and then I would just fetch the image directly
        // but it doesn't work, as I shall now show
        
        let image2 = UIImage(named: "photo")!       // trying to use asset catalog alignment
        let imageView2 = UIImageView(image:image2)
        self.view.addSubview(imageView2)
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
            imageView2.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor),
            imageView2.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor)
            ])

        // In the asset catalog, it is the Top, not the Bottom, that I have set
        // Moreover, if I don't also set the Left, nothing happens at all; 
        // a Left of 0 turns off the whole thing
        
        print(image2.alignmentRectInsets) // C.UIEdgeInsets(top: 0.0, left: 0.5, bottom: 24.0, right: 0.0)
        // but what I set was the top!
        print(imageView2.alignmentRectInsets())
    }
}


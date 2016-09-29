

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var views : [UIView]!

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let mainView = self.view
        
        for view in views {
            view.removeFromSuperview()
        }
        
        // give the stack view arranged subviews
        let stackView = UIStackView(arrangedSubviews: views)
        
        // configure the stack view
        stackView.axis = .Vertical
        stackView.alignment = .Fill
        stackView.distribution = .EqualSpacing
        
        
        // constrain the stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(stackView)
        
        NSLayoutConstraint.activateConstraints([
            stackView.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraintEqualToAnchor(mainView.leadingAnchor),
            stackView.trailingAnchor.constraintEqualToAnchor(mainView.trailingAnchor),
            stackView.bottomAnchor.constraintEqualToAnchor(mainView.bottomAnchor),
        ])
    }
}


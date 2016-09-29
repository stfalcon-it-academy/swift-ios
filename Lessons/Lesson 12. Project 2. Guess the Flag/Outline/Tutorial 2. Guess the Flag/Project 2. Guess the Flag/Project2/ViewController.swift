//
//  ViewController.swift
//  Project2
//
//  Created by Hudzilla on 13/09/2015.
//  Copyright © 2015 Paul Hudson. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var buttonsCollection: [Button]!
    
//	@IBOutlet weak var button1: UIButton!
//	@IBOutlet weak var button2: UIButton!
//	@IBOutlet weak var button3: UIButton!
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var contentViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    
	var countries = [String]()
	var correctAnswer = 0
	var score = 0
    var viewSize = CGSize()

    
    // MARK: - Class Functions
	override func viewDidLoad() {
		super.viewDidLoad()

		countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        for button in buttonsCollection {
            button.setup()
        }
        
//		button1.layer.borderWidth = 1
//		button2.layer.borderWidth = 1
//		button3.layer.borderWidth = 1
//
//		button1.layer.borderColor = UIColor.lightGrayColor().CGColor
//		button2.layer.borderColor = UIColor.lightGrayColor().CGColor
//		button3.layer.borderColor = UIColor.lightGrayColor().CGColor
//        
		askQuestion(nil)
	}

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        viewSize = view.bounds.size
        setContentViewFrame(viewSize: viewSize)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    @IBAction func buttonTapped(sender: Button) {
        let title = sender.tapped(&score, correctAnswer: correctAnswer)
        
//        if sender.tag == correctAnswer {
//            title = "Correct"
//            score += 1
//        } else {
//            title = "Wrong"
//            score -= 1
//        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        
        presentViewController(ac, animated: true, completion: nil)
    }

    
    // MARK: - Custom Functions
	func askQuestion(action: UIAlertAction!) {
		countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]

        for button in buttonsCollection {
            button.changeImage(countries)
        }
        
//		button1.setImage(UIImage(named: countries[0]), forState: .Normal)
//		button2.setImage(UIImage(named: countries[1]), forState: .Normal)
//		button3.setImage(UIImage(named: countries[2]), forState: .Normal)

		correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
		title = countries[correctAnswer].uppercaseString
	}
    
    func setContentViewFrame(viewSize size: CGSize) {
        switch size {
        // Landscape
        case _ where size.width > size.height:
            contentViewWidthConstraint.constant = viewSize.width
            contentViewHeightConstraint.constant += 44.0

        // Portrait
        default:
            contentViewWidthConstraint.constant = viewSize.width
            contentViewHeightConstraint.constant = viewSize.height - 64.0
        }
        
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
    }
}


// MARK: - UIContentContainer
extension ViewController {
    // Из этого метода можно получить новый размер view (холста) контроллера
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        viewSize = size

        setContentViewFrame(viewSize: viewSize)
    }
}


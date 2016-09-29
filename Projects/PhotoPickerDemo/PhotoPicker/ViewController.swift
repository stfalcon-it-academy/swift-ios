//
//  ViewController.swift
//  PhotoPicker
//
//  Created by msm72 on 29.05.16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    // MARK: - Properties
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func handlerMakePhotoButtonTap(sender: CustomButton) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .Camera
            imagePicker.allowsEditing = true
            
            presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController.init(title: "Info", message: "Please, use App on a real device", preferredStyle: .Alert)
            let actionOk = UIAlertAction(title: "OK", style: .Default, handler: { (action) in
                self.photoImageView.image = UIImage(named: "upload-empty")
            })
            alertController.addAction(actionOk)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
}


// MARK: - UIImagePickerControllerDelegate
extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { 
            self.photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.photoImageView.image = nil
    }
}
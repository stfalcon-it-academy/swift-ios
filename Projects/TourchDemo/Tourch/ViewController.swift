//
//  ViewController.swift
//  Tourch
//
//  Created by msm72 on 26.05.16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func handlerTourchButtonTap(sender: UIButton) {
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        if device != nil {
            if device.hasTorch {
                do {
                    try device.lockForConfiguration()
                    device.torchMode = device.torchMode == AVCaptureTorchMode.On ? .Off : .On
                    sender.setTitle(device.torchMode == .Off ? "Tourch On" : "Tourch Off", forState: .Normal)
                    device.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
        } else {
            let alertController = UIAlertController.init(title: "Info", message: "Please, use App on a real device", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    // TODO: - TODO
    func test1() {
        print("test1")
    }
    

    // FIXME: - FIXME
    func test2() {
        print("test2")
    }
}

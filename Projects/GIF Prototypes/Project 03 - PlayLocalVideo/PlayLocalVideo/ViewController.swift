//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Allen on 16/1/9.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var videoTableView: UITableView!
    
    var data = [
        Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        Video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.indicatorStyle = .White
        
        // Delegates
        videoTableView.dataSource = self
        videoTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func playVideoButtonDidTouch(sender: AnyObject) {
        let videoFilePath = NSBundle.mainBundle().pathForResource("invitation", ofType: "mp4")
        playerView = AVPlayer(URL: NSURL(fileURLWithPath: videoFilePath!))
        playViewController.player = playerView
        
        self.presentViewController(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
        let video = data[indexPath.row]
        
        cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
    
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
}


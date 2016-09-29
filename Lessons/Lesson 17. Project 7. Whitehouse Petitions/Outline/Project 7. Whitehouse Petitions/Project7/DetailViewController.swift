//
//  DetailViewController.swift
//  Project7
//
//  Created by Hudzilla on 14/09/2015.
//  Copyright © 2015 Paul Hudson. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    // MARK: - Properties
	var webView: WKWebView!
	var detailItem: [String: String]!

    
    // MARK: - Class Functions
	override func loadView() {
		webView = WKWebView()
		view = webView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		guard detailItem != nil else { return }

		if let body = detailItem["body"] {
			var html = "<html>"
            let title = detailItem["title"]
            
			html += "<head>"
			html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
			html += "<style> body { font-size: 150%; } </style>"
			html += "</head>"
			html += "<body>"
            html += body.isEmpty ? title! : body
			html += "</body>"
			html += "</html>"
            
			webView.loadHTMLString(html, baseURL: nil)
		}
	}
}


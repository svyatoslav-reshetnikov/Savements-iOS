//
//  ViewController.swift
//  Savements-iOS
//
//  Created by SVYAT on 31.07.15.
//  Copyright (c) 2015 HiT2B. All rights reserved.
//

import UIKit
import SwiftLoader

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    let url = "http://m.savements.ru/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        
        webView.delegate = self
        webView.scalesPageToFit = true
        
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 150
        config.spinnerColor = Utils().colorFromRGB(68, green: 72, blue: 75, alpha: 1.0)
        config.backgroundColor = Utils().colorFromRGB(230, green: 230, blue: 230, alpha: 1.0)
        config.titleTextColor = Utils().colorFromRGB(68, green: 72, blue: 75, alpha: 1.0)
        
        SwiftLoader.setConfig(config)
        SwiftLoader.show(title: "Loading...", animated: true)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SwiftLoader.hide()
    }


}


//
//  ViewController.swift
//  Savements-iOS
//
//  Created by SVYAT on 31.07.15.
//  Copyright (c) 2015 HiT2B. All rights reserved.
//

import UIKit
import SwiftLoader
import ReachabilitySwift

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    let reachability = Reachability.reachabilityForInternetConnection()
    let url = "http://m.savements.ru/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        reachability.whenReachable = { reachability in
            if reachability.isReachableViaWiFi() {
                println("Reachable via WiFi")
                self.setWebView()
            } else {
                println("Reachable via Cellular")
                self.setWebView()
            }
        }
        reachability.whenUnreachable = { reachability in
            println("Not reachable")
            self.showAlert()
        }
        
        reachability.startNotifier()
        
        if (reachability.currentReachabilityStatus == Reachability.NetworkStatus.NotReachable) {
            showAlert()
            println("Not reachable")
        }
        else {
            setWebView()
            println("OK")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setWebView() {
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        
        webView.delegate = self
        webView.scalesPageToFit = true
        
        webView.loadRequest(request)
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Соединение прервано", message:
            "Проверьте ваше интернет-соединение в настройках", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
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


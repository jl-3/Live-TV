//
//  FullChaneelViewController.swift
//  BDTV
//
//  Created by Mazharul on 5/21/17.
//  Copyright © 2017 Mazharul. All rights reserved.
//

import UIKit

class FullChaneelViewController: UIViewController {
    
    @IBOutlet weak var WebView: UIWebView!
    @IBOutlet weak var LabelName: UILabel!
    
    var Belal = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        LabelName.text = Belal
        
        
        self.WebView.frame = self.view.bounds
        WebView.frame = self.view.bounds
        let requestURL = NSURL(string:Belal)
        let request = NSURLRequest(url: requestURL! as URL)
        WebView.loadRequest(request as URLRequest)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//
//  YMLoginViewController.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//

import UIKit

/// ![](http://obna9emby.bkt.clouddn.com/news/login_spec.png)
class YMLoginViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.borderColor = YMColor(246, g: 68, b: 65, a: 1.0).CGColor
        registerButton.layer.borderWidth = klineWidth
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonClick(sender: UIButton) {
        
    }
    
    @IBAction func registerButtonClick(sender: UIButton) {
        
    }
}

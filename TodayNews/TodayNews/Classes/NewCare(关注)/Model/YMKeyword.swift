//
//  YMKeyword.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//

import UIKit

class YMKeyword: NSObject {
    var keyword: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        keyword = dict["keyword"] as? String
    }
    
}

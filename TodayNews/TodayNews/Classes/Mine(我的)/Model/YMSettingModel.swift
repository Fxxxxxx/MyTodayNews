//
//  YMSettingModel.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//

import UIKit

class YMSettingModel: NSObject {
    var title: String?
    var subtitle: String?
    var rightTitle: String?
    var isHiddenLine: Bool?
    var isHiddenSubtitle: Bool?
    var isHiddenSwitch: Bool?
    var isHiddenArraw: Bool?
    var isHiddenRightTitle: Bool?
    
    init(dict: [String: AnyObject]) {
        super.init()
        title = dict["title"] as? String
        subtitle = dict["subtitle"] as? String
        rightTitle = dict["rightTitle"] as? String
        isHiddenLine = dict["isHiddenLine"] as? Bool
        isHiddenSubtitle = dict["isHiddenSubtitle"] as? Bool
        isHiddenArraw = dict["isHiddenArraw"] as? Bool
        isHiddenSwitch = dict["isHiddenSwitch"] as? Bool
        isHiddenRightTitle = dict["isHiddenRightTitle"] as? Bool
    }
}

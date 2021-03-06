//
//  YMSettingHeaderView.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//

import UIKit

protocol YMSettingHeaderViewDelegate: NSObjectProtocol {
    func settingHeaderView(headerView: YMSettingHeaderView, accountManageButton: UIButton)
}

class YMSettingHeaderView: UIView {
    
    weak var delegate: YMSettingHeaderViewDelegate?
    
    class func settingHeaderView() -> YMSettingHeaderView {
        return NSBundle.mainBundle().loadNibNamed(String(self), owner: nil, options: nil).last as! YMSettingHeaderView
    }
    
    @IBOutlet weak var accountManageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func accountManageButtonClick(sender: UIButton) {
        delegate?.settingHeaderView(self,  accountManageButton: sender)
    }
}

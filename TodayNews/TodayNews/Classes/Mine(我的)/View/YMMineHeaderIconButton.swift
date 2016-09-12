//
//  YMMineHeaderIconButton.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//
//  我的界面-> 头部 view -> 头像按钮
//

import UIKit

class YMMineHeaderIconButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .Center
        titleLabel?.font = UIFont.systemFontOfSize(18)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        imageView?.layer.cornerRadius = 30
        imageView?.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 调整图片
        imageView?.x = kMargin
        imageView?.y = 0
        imageView?.width = 60
        imageView?.height = imageView!.width
        // 调整文字
        titleLabel?.x = 0
        titleLabel?.y = imageView!.height + kMargin
        titleLabel?.width = self.width
        titleLabel?.height = 2 * kMargin
    }
    
}

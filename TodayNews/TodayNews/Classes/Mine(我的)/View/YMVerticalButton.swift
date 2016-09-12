//
//  YMVerticalButton.swift
//  DanTang
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//

import UIKit

class YMVerticalButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .Center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 调整图片
        imageView?.centerX = self.width * 0.5
        imageView?.y = kMargin
        imageView?.width = 24
        imageView?.height = imageView!.width
        // 调整文字
        titleLabel?.x = 0
        titleLabel?.y = imageView!.height
        titleLabel?.width = self.width
        titleLabel?.height = self.height - self.titleLabel!.y
    }
    
}

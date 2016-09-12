//
//  YMTipView.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//
//  每次刷新显示的提示标题 view
//

import UIKit
import SnapKit

/// ![](http://obna9emby.bkt.clouddn.com/news/home-tip.png)
class YMTipView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = YMColor(215, g: 233, b: 246, a: 1.0)
        addSubview(tipLabel)
        
        tipLabel.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    /// 提示标题的 label
    lazy var tipLabel: UILabel = {
        let tipLabel = UILabel()
        tipLabel.textColor = YMColor(91, g: 162, b: 207, a: 1.0)
        tipLabel.textAlignment = .Center
        
        tipLabel.transform = CGAffineTransformMakeScale(0.9, 0.9)
        return tipLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

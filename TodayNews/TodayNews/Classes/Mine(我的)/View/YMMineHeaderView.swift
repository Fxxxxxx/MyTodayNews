//
//  YMMineHeaderView.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//
//  我的界面 -> 头部
//

import UIKit
import SnapKit

class YMMineHeaderView: UIView {
    
    /// 头像按钮点击的回调
    var headerViewClosure: ((iconButton: UIButton) -> ())?
    
    class func headerView() -> YMMineHeaderView {
        let frame = CGRectMake(0, 0, SCREENW, 260)
        return YMMineHeaderView(frame: frame)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        // 设置 UI
        setupUI()
    
    }
    
    /// 设置 UI
    private func setupUI() {
        // 添加背景图片
        addSubview(bgImageView)
        // 添加头像按钮
        addSubview(headPhotoButton)
        // 添加底部 view
        addSubview(bottomView)
        
        // 设置约束
        bgImageView.snp_makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self).offset(-2 * kMargin)
            make.height.equalTo(kYMMineHeaderImageHeight)
        }
        
        headPhotoButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(0)
            make.size.equalTo(CGSizeMake(80, 80))
            make.top.equalTo(bgImageView.snp_top).offset(64)
        }
        
        bottomView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.top.equalTo(bgImageView.snp_bottom)
        }
    }
    
    /// 懒加载，创建背景图片
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "hrscy")
        return bgImageView
    }()
    
    /// 懒加载，创建头像按钮
    lazy var headPhotoButton: YMMineHeaderIconButton = {
        let headPhotoButton = YMMineHeaderIconButton()
        headPhotoButton.addTarget(self, action: #selector(headPhotoBtnClick(_:)), forControlEvents: .TouchUpInside)
        headPhotoButton.setTitle("hrscy", forState: .Normal)
        headPhotoButton.setImage(UIImage(named: "hrscy"), forState: .Normal)
        return headPhotoButton
    }()
    
    /// 懒加载，创建底部白色 view
    lazy var bottomView: YMMineHeaderBottomView = {
        let bottomView = YMMineHeaderBottomView()
        return bottomView
    }()
    
    /// 头像按钮点击
    func headPhotoBtnClick(button: YMMineHeaderIconButton) {
        headerViewClosure?(iconButton: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

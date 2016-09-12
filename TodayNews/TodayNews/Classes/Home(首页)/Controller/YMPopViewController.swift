//
//  YMPopViewController.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//
//  弹出新闻屏蔽内容
//

import UIKit

class YMPopViewController: UIViewController {

    var filterWords = [YMFilterWord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        view.addSubview(popView)
        popView.filterWords = filterWords
        switch filterWords.count {
        case 0:
            popView.frame = CGRectZero
        case 1, 2:
            popView.frame = CGRectMake(0, 8, SCREENW - 2 * kHomeMargin, 93)
        case 3, 4:
            popView.frame = CGRectMake(0, 8, SCREENW - 2 * kHomeMargin, 130)
        case 5, 6:
            popView.frame = CGRectMake(0, 8, SCREENW - 2 * kHomeMargin, 167)
        default:
            popView.frame = CGRectZero
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var popView: YMPopView = {
        let popView = YMPopView()
        
        return popView
    }()

}

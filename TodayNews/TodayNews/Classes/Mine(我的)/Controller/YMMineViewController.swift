//
//  YMMineViewController.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//
///

import UIKit

let mineCellID = "YMMineCell"
/// ![](http://obna9emby.bkt.clouddn.com/news/%E6%88%91%E7%9A%84-%E6%9C%AA%E7%99%BB%E5%BD%95_spec.png)
/// ![](http://obna9emby.bkt.clouddn.com/news/%E6%88%91%E7%9A%84.png)
class YMMineViewController: UITableViewController {
    
    var cells = [AnyObject]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 从 plist 加载数据
        loadCellFromPlist()
        // 设置 UI
        setupUI()
    }
    
    // 从 plist 加载数据
    private func loadCellFromPlist() {
        let path = NSBundle.mainBundle().pathForResource("YMMineCellPlist", ofType: "plist")
        let cellPlist = NSArray.init(contentsOfFile: path!)
        for arrayDict in cellPlist! {
            let array = arrayDict as! NSArray
            var sections = [AnyObject]()
            for dict in array {
                let cell = YMMineCellModel(dict: dict as! [String: AnyObject])
                sections.append(cell)
            }
            cells.append(sections)
        }
    }

    private func setupUI() {
        view.backgroundColor = YMGlobalColor()
        let nib = UINib(nibName: String(YMMineCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: mineCellID)
        let footerView = UIView()
        footerView.height = kMargin
        tableView.tableFooterView = footerView
        tableView.rowHeight = kMineCellH
        tableView.separatorStyle = .None
        NSUserDefaults.standardUserDefaults().boolForKey(isLogin) ? (tableView.tableHeaderView = headerView) : (tableView.tableHeaderView = noLoginHeaderView)
        headerView.headerViewClosure = { (iconButton) in
            print(iconButton)
        }
        
        headerView.bottomView.collectionButtonClosure = { (collectionButton) in
            let collectionVC = YMCollectionViewController()
            collectionVC.title = "收藏"
            self.navigationController?.pushViewController(collectionVC, animated: true)
        }
        
        headerView.bottomView.nightButtonClosure = { (nightButton) in
            print(nightButton)
        }

        headerView.bottomView.settingButtonClosure = { (settingButton) in
            let settingVC = YMSettingViewController()
            settingVC.title = "设置"
            self.navigationController?.pushViewController(settingVC, animated: true)
        }
        
        noLoginHeaderView.bottomView.collectionButtonClosure = headerView.bottomView.collectionButtonClosure
        
        noLoginHeaderView.bottomView.nightButtonClosure = headerView.bottomView.nightButtonClosure
        
        noLoginHeaderView.bottomView.settingButtonClosure = headerView.bottomView.settingButtonClosure
        
    }
    
    /// 懒加载，创建 未登录 headerView
    private lazy var noLoginHeaderView: YMMineNoLoginHeaderView = {
        let noLoginHeaderView = YMMineNoLoginHeaderView.noLoginHeaderView()
        noLoginHeaderView.delegate = self
        return noLoginHeaderView
    }()
    
    /// 懒加载，创建 headerView
    private lazy var headerView: YMMineHeaderView = {
        let headerView = YMMineHeaderView.headerView()
        return headerView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMMineViewController: YMMineNoLoginHeaderViewDelegate {
    
    // MARK: - YMMineNoLoginHeaderViewDelegate
    func noLoginHeaderView(headerView: YMMineNoLoginHeaderView, mobileLoginButtonClick: UIButton) {
        print(#function)
    }
    
    func noLoginHeaderView(headerView: YMMineNoLoginHeaderView, wechatLoginButtonClick: UIButton) {
        print(#function)
    }
    
    func noLoginHeaderView(headerView: YMMineNoLoginHeaderView, qqLoginButtonClick: UIButton) {
        print(#function)
    }
    
    func noLoginHeaderView(headerView: YMMineNoLoginHeaderView, weiboLoginButtonClick: UIButton) {
        print(#function)
    }
    
    func noLoginHeaderView(headerView: YMMineNoLoginHeaderView, moreLoginButtonClick: UIButton) {
        let loginVC = YMLoginViewController()
        loginVC.title = "登录"
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kMargin
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cells.count ?? 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellAyyay = cells[section] as! [YMMineCellModel]
        return cellAyyay.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(mineCellID) as! YMMineCell
        let cellArray = cells[indexPath.section] as! [YMMineCellModel]
        cell.cellModel = cellArray[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let loginVC = YMLoginViewController()
                loginVC.title = "登录"
                navigationController?.pushViewController(loginVC, animated: true)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 1 {
                let offlineVC = YMOfflineTableViewController()
                offlineVC.title = "离线下载"
                navigationController?.pushViewController(offlineVC, animated: true)
            } else if indexPath.row == 2{
                let activityVC = YMActivityController()
                activityVC.title = "活动"
                navigationController?.pushViewController(activityVC, animated: true)
            } else if indexPath.row == 4 {
                let loginVC = YMLoginViewController()
                loginVC.title = "登录"
                navigationController?.pushViewController(loginVC, animated: true)
            }
        }
    }
    
    // MARK: - UIScrollViewDelagate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            if NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
                var tempFrame = headerView.bgImageView.frame
                tempFrame.origin.y = offsetY
                tempFrame.size.height = kYMMineHeaderImageHeight - offsetY
                headerView.bgImageView.frame = tempFrame
            headerView.bgImageView.snp_updateConstraints(closure: { (make) in
                make.height.equalTo(tempFrame.size.height)
            })
            } else {
                var tempFrame = noLoginHeaderView.bgImageView.frame
                tempFrame.origin.y = offsetY
                tempFrame.size.height = kYMMineHeaderImageHeight - offsetY
                noLoginHeaderView.bgImageView.frame = tempFrame
            }
        }
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

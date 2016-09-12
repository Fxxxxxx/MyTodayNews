//
//  YMSettingCell.swift
//  TodayNews
//
//  Created by Fxxx on 16/9/7.
//  Copyright © 2016年 Fxxx. All rights reserved.
//

import UIKit

class YMSettingCell: UITableViewCell {
    
    var setting: YMSettingModel! {
        didSet {
            titleLabel.text = setting.title
            subtitleLabel.text = setting.subtitle
            rightTitleLabel.text = setting.rightTitle
            arrowImageView.hidden = setting.isHiddenArraw!
            switchView.hidden = setting.isHiddenSwitch!
            lineView.hidden = setting.isHiddenLine!
            rightTitleLabel.hidden = setting.isHiddenRightTitle!
            if setting.subtitle?.characters.count > 0 {
                titleConstraint.constant = -kMargin
            }
        }
    }

    @IBOutlet weak var titleConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var rightTitleLabel: UILabel!
    
    @IBOutlet weak var arrowImageView: UIImageView!
    
    @IBOutlet weak var switchView: UISwitch!
    
    @IBOutlet weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/7/24.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        backgroundColor = Constant.Color.themeColor
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(_ data: Setting){
        imageView?.image = data.image
        
        textLabel?.text = data.title
        textLabel?.font = TamaFont.secondary.bold()
        
        detailTextLabel?.text = data.subtitle
        detailTextLabel?.font = TamaFont.secondary.medium()
    }
}

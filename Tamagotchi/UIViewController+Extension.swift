//
//  UIViewController+Extension.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit

extension UIViewController {
    func configureView(_ title: String){
        navigationItem.title = title
        view.backgroundColor = .themeColor
    }
    
}

//
//  UIViewController+Extension.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit


extension UIViewController {
    func configureView(_ type: Constant.ViewType){
        navigationItem.title = type.title
        view.backgroundColor = Constant.Color.themeColor
    }
    
    func alert(_ t: String?, _ message: String?, _ style: UIAlertController.Style){
        let alert = UIAlertController(title: t, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

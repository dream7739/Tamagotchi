//
//  UIViewController+Extension.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit

enum ViewType {
    case select
    case edit
    case main
    case setting
    case owner
    
    var title: String {
        switch self {
        case .select:
            return "다마고치 선택하기"
        case .edit:
            return  "다마고치 변경하기"
        case .main:
            return "\(TamaManager.owner)님의 다마고치"
        case .setting:
            return "설정"
        case .owner:
            return "대장님 이름 정하기"
        }
    }
}

extension UIViewController {
    func configureView(_ type: ViewType){
        navigationItem.title = type.title
        view.backgroundColor = .themeColor
    }
    
    func alert(_ t: String?, _ message: String?, _ style: UIAlertController.Style){
        let alert = UIAlertController(title: t, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

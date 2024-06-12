//
//  Constant.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/12/24.
//

import UIKit

enum Constant {
    
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
    
    enum Color {
        static let themeColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        static let contentColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
    
    enum Image {
        static let bubbleBox: UIImage = UIImage(named: "bubble")!
        static let rice: UIImage = UIImage(systemName: "drop.circle")!
        static let water: UIImage = UIImage(systemName: "leaf.circle")!
        static let nameIcon: UIImage = UIImage(systemName: "pencil")!
        static let changeIcon: UIImage = UIImage(systemName: "moon.fill")!
        static let resetIcon: UIImage = UIImage(systemName: "arrow.clockwise")!
        static let profile: UIImage = UIImage(systemName: "person.crop.circle")!
        static let back: UIImage = UIImage(systemName: "chevron.left")!
    }
    
}

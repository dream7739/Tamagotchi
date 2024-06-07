//
//  TamaFont.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit

enum TamaFont: String {
    case primary
    case secondary
    
    func bold() -> UIFont{
        switch self{
        case .primary:
            return .boldSystemFont(ofSize: 15)
        case .secondary:
            return .boldSystemFont(ofSize: 13)
        }
    }
    
    func medium() -> UIFont {
        switch self {
        case .primary:
            return .systemFont(ofSize: 15, weight: .medium)
        case .secondary:
            return .systemFont(ofSize: 13, weight: .medium)
        }
    }
    
    func regular() -> UIFont {
        switch self {
        case .primary:
              return  .systemFont(ofSize: 15)
        case .secondary:
            return .systemFont(ofSize: 13)
        }
    }
    
    
}

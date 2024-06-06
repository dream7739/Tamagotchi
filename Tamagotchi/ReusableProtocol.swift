//
//  ReusableProtocol.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit

protocol ReusableProtocol: AnyObject {
    static var identifier: String { get }
}

extension UIViewController : ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell : ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

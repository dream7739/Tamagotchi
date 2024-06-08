//
//  PaddingLabel.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/8/24.
//

import UIKit

class PaddingLabel: UILabel {
    let topInset: CGFloat = 8.0
    let bottomInset: CGFloat = 8.0
    let leftInset: CGFloat = 4.0
    let rightInset: CGFloat = 4.0
    
    override func drawText(in rect: CGRect) {
        let inset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: inset))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
}

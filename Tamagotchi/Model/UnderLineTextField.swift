//
//  UnderLineTextField.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/8/24.
//

import UIKit
import SnapKit

class UnderLineTextField : UITextField {
    
    let underLineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(underLineView)
        
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
        font = TamaFont.primary.medium()
        tintColor = .contentColor
        textColor = .contentColor

        underLineView.backgroundColor = .contentColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

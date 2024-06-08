//
//  TamaCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit
import SnapKit

class TamaCollectionViewCell: UICollectionViewCell {
    
    let tamaImageView = UIImageView()
    
    let nameLabel = PaddingLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy(){
        contentView.addSubview(tamaImageView)
        contentView.addSubview(nameLabel)
    }
    
    func configureLayout(){
        tamaImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.size.equalToSuperview().multipliedBy(0.8)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.18)
        }
    }
    
    func configureUI(){
        tamaImageView.contentMode = .scaleAspectFill
        
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.borderColor = UIColor.contentColor.cgColor
        nameLabel.textAlignment = .center
        nameLabel.font = TamaFont.secondary.medium()
        nameLabel.textColor = .contentColor
    }
    
    func configureData(_ data : Tamagotchi){
        tamaImageView.image = data.tamaImage
        nameLabel.text = data.name
    }

}

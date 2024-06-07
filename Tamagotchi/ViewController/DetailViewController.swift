//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit
import SnapKit

class DetailViewController : UIViewController {
    
    let tamaView = UIView()
    
    let tamaImageView = UIImageView()
    
    let nameLabel = UILabel()
    
    let seperateLabel = UILabel()
    
    let descriptionLabel = UILabel()
    
    let cancelButton = UIButton(type: .system)
    
    let startButton = UIButton(type: .system)
    
    var tama: Tamagotchi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureData()
    }
    
    func configureHierarchy(){
        view.addSubview(tamaView)
        
        tamaView.addSubview(tamaImageView)
        tamaView.addSubview(nameLabel)
        tamaView.addSubview(seperateLabel)
        tamaView.addSubview(descriptionLabel)
        tamaView.addSubview(cancelButton)
        tamaView.addSubview(startButton)
    }
    
    func configureLayout(){
        tamaView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(tamaView.snp.width).multipliedBy(1.4)
        }
        
        tamaImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.size.equalToSuperview().multipliedBy(0.3)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(tamaImageView)
            make.top.equalTo(tamaImageView.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
        
        
        seperateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(1)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(seperateLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(50)
            make.height.lessThanOrEqualTo(100)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(50)
        }
        
        startButton.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(cancelButton)
        }
    }
    
    func configureUI(){
        view.backgroundColor = .black.withAlphaComponent(0.3)
        
        tamaView.backgroundColor = .themeColor
        tamaView.layer.cornerRadius = 6
        
        tamaImageView.contentMode = .scaleAspectFill
        
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.borderColor = UIColor.contentColor.cgColor
        nameLabel.textAlignment = .center
        nameLabel.font = TamaFont.primary.bold()
        nameLabel.textColor = .contentColor
        
        seperateLabel.backgroundColor = .contentColor
        
        descriptionLabel.font = TamaFont.primary.medium()
        descriptionLabel.textColor = .contentColor
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.tintColor = .contentColor
        cancelButton.backgroundColor = .contentColor.withAlphaComponent(0.1)
        
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        startButton.setTitle("시작하기", for: .normal)
        startButton.tintColor = .contentColor
        
    }
    
    @objc func cancelButtonClicked(){
        dismiss(animated: true)
    }
    
    @objc func startButtonClicked(){
        let vc = MainViewController()
        vc.tama = tama
        let nav = UINavigationController(rootViewController: vc)
        nav.modalTransitionStyle = .crossDissolve
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    func configureData(){
        guard let tama else { return }
        
        tamaImageView.image = tama.tamaImage
        nameLabel.text = tama.name
        descriptionLabel.text = tama.type.desciption
        
    }
}

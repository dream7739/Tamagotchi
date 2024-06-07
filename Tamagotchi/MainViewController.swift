//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/7/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let bubbleImageView = UIImageView()
    
    let mentLabel = UILabel()
    
    let tamaImageView = UIImageView()
    
    let nameLabel = UILabel()
    
    let descriptionLabel = UILabel()
    
    let riceStackView = UIStackView()
    
    let waterStackVeiw = UIStackView()
    
    let riceTextField = UITextField()
    
    let waterTextField = UITextField()
    
    let riceButton = UIButton(type: .system)
    
    let waterButton = UIButton(type: .system)
    
    var tama: Tamagotchi?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView("대장님의 다마고치")
        configureHierarchy()
        configureLayout()
        configureUI()
        configureData()
    }
    
    func configureHierarchy(){
        view.addSubview(bubbleImageView)
        view.addSubview(mentLabel)
        view.addSubview(tamaImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(riceStackView)
        view.addSubview(waterStackVeiw)
        
        riceStackView.addArrangedSubview(riceTextField)
        riceStackView.addArrangedSubview(riceButton)

        waterStackVeiw.addArrangedSubview(waterTextField)
        waterStackVeiw.addArrangedSubview(waterButton)
    }

    func configureLayout(){
        bubbleImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
        }
        
        mentLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(bubbleImageView).inset(10)
            make.centerY.equalTo(bubbleImageView).offset(-7)
        }
        
        tamaImageView.snp.makeConstraints { make in
            make.top.equalTo(bubbleImageView.snp.bottom).offset(3)
            make.size.equalTo(200)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(tamaImageView.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        riceStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        riceTextField.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(35)
        }
        
        riceButton.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
        
        waterStackVeiw.snp.makeConstraints { make in
            make.top.equalTo(riceStackView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        waterTextField.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(35)
        }
        
        waterButton.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
    }

    func configureUI(){
        bubbleImageView.image = .bubbleBox
        bubbleImageView.contentMode = .scaleAspectFill
        
        mentLabel.font = TamaFont.primary.bold()
        mentLabel.textColor = .contentColor
        mentLabel.textAlignment = .center
        
        tamaImageView.contentMode = .scaleAspectFill
        
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.borderColor = UIColor.contentColor.cgColor
        nameLabel.textAlignment = .center
        nameLabel.font = TamaFont.primary.bold()
        nameLabel.textColor = .contentColor
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = TamaFont.secondary.bold()
        descriptionLabel.textColor = .contentColor
        
        riceStackView.axis = .horizontal
        riceStackView.spacing = 8
        
        riceTextField.font = TamaFont.primary.medium()
        riceTextField.placeholder = "밥주세용"
        riceTextField.textAlignment = .center
        riceTextField.tintColor = .contentColor
        riceTextField.borderStyle = .roundedRect
        
        riceButton.setTitle("밥먹기", for: .normal)
        riceButton.setImage(.rice, for: .normal)
        riceButton.tintColor = .contentColor
        riceButton.layer.cornerRadius = 5
        riceButton.layer.borderWidth = 1.3
        riceButton.layer.borderColor = UIColor.contentColor.cgColor

        waterStackVeiw.axis = .horizontal
        waterStackVeiw.spacing = 8
        
        waterTextField.font = TamaFont.primary.medium()
        waterTextField.placeholder = "물주세용"
        waterTextField.textAlignment = .center
        waterTextField.tintColor = .contentColor
        waterTextField.borderStyle = .roundedRect
        
        waterButton.setTitle("물먹기", for: .normal)
        waterButton.setImage(.water, for: .normal)
        waterButton.tintColor = .contentColor
        waterButton.layer.cornerRadius = 5
        waterButton.layer.borderWidth = 1.3
        waterButton.layer.borderColor = UIColor.contentColor.cgColor
    }

    func configureData(){
        guard let tama else { return }
        mentLabel.text = tama.ment
        tamaImageView.image = tama.tamaImage
        nameLabel.text = tama.name
        descriptionLabel.text = tama.description
    }

  

}

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
    
    var tama: Tamagotchi? {
        didSet {
            guard let tama else { return }
            tamaImageView.image = tama.tamaImage
            mentLabel.text = tama.ment
            descriptionLabel.text = tama.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView("\(TamaResult.ownerName)님의 다마고치")
        configureNav()
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
    
    func configureNav(){
        let setting = UIBarButtonItem(image: .profile, style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationItem.rightBarButtonItem = setting
        navigationController?.navigationBar.tintColor = .contentColor
    }
    
    @objc func settingButtonClicked(){
        let vc = SettingViewController()
        navigationController?.pushViewController(vc, animated: true)
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
        riceTextField.keyboardType = .numberPad
        
        riceButton.addTarget(self, action: #selector(riceButtonClicked), for: .touchUpInside)
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
        waterTextField.keyboardType = .numberPad
        
        waterButton.addTarget(self, action: #selector(waterButtonClicked), for: .touchUpInside)
        waterButton.setTitle("물먹기", for: .normal)
        waterButton.setImage(.water, for: .normal)
        waterButton.tintColor = .contentColor
        waterButton.layer.cornerRadius = 5
        waterButton.layer.borderWidth = 1.3
        waterButton.layer.borderColor = UIColor.contentColor.cgColor
    }
    
    @objc func riceButtonClicked(){
        
        let input = riceTextField.text!
        
        if input.isEmpty {
            tama?.rice += 1
        }else{
            riceTextField.text = ""
            
            guard let quantity = Int(input), quantity <= Tamagotchi.riceLimit else {
                alert("알림", "밥은 한번에 \(Tamagotchi.riceLimit)개까지 먹을 수 있어요", .alert)
                return
            }
            
            tama?.rice += quantity
        }
    }
    
    @objc func waterButtonClicked(){
        
        let input = waterTextField.text!
        
        if input.isEmpty {
            tama?.water += 1
        }else{
            waterTextField.text = ""
            
            guard let quantity = Int(input), quantity <= Tamagotchi.waterLimit else {
                alert("알림", "물은 한번에 \(Tamagotchi.waterLimit)개까지 먹을 수 있어요", .alert)
                return
            }
            
            tama?.water += quantity
        }
    }
    
    func configureData(){
        guard let tama else { return }
        mentLabel.text = tama.ment
        tamaImageView.image = tama.tamaImage
        nameLabel.text = tama.name
        descriptionLabel.text = tama.description
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

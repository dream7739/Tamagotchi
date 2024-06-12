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
    
    let nameLabel = PaddingLabel()

    let descriptionLabel = UILabel()
    
    let riceStackView = UIStackView()
    
    let waterStackVeiw = UIStackView()
    
    let riceTextField = UnderLineTextField()
    
    let waterTextField = UnderLineTextField()
    
    let riceButton = UIButton(type: .system)
    
    let waterButton = UIButton(type: .system)
    
    var tama: Tamagotchi?
    
    override func viewWillAppear(_ animated: Bool) {
        configureView(Constant.ViewType.main)
        mentLabel.text = tama?.ment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let setting = UIBarButtonItem(image: Constant.Image.profile, style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationItem.rightBarButtonItem = setting
        navigationController?.navigationBar.tintColor = Constant.Color.contentColor
    }
    
    @objc func settingButtonClicked(){
        let vc = SettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    func configureLayout(){
        bubbleImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(140)
            make.width.equalToSuperview().multipliedBy(0.6)

        }
        
        mentLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(bubbleImageView).inset(15)
            make.top.equalTo(bubbleImageView.snp.top).offset(15)
            make.bottom.equalTo(bubbleImageView.snp.bottom).offset(-30)
        }
        
        tamaImageView.snp.makeConstraints { make in
            make.top.equalTo(bubbleImageView.snp.bottom).offset(10)
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
        bubbleImageView.contentMode = .scaleToFill
        bubbleImageView.image = Constant.Image.bubbleBox
        
        mentLabel.font = TamaFont.primary.bold()
        mentLabel.textColor = Constant.Color.contentColor
        mentLabel.textAlignment = .center
        mentLabel.numberOfLines = 0
        
        tamaImageView.contentMode = .scaleAspectFill
        
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.borderColor = Constant.Color.contentColor.cgColor
        nameLabel.textAlignment = .center
        nameLabel.font = TamaFont.primary.bold()
        nameLabel.textColor = Constant.Color.contentColor
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = TamaFont.secondary.bold()
        descriptionLabel.textColor = Constant.Color.contentColor
        
        riceStackView.axis = .horizontal
        riceStackView.spacing = 8
        
        riceTextField.placeholder = "밥주세용"
        riceTextField.textAlignment = .center
        riceTextField.keyboardType = .numberPad
        
        riceButton.addTarget(self, action: #selector(riceButtonClicked), for: .touchUpInside)
        riceButton.setTitle("밥먹기", for: .normal)
        riceButton.setImage(Constant.Image.rice, for: .normal)
        riceButton.tintColor = Constant.Color.contentColor
        riceButton.layer.cornerRadius = 5
        riceButton.layer.borderWidth = 1.3
        riceButton.layer.borderColor = Constant.Color.contentColor.cgColor
        
        waterStackVeiw.axis = .horizontal
        waterStackVeiw.spacing = 8
        
        waterTextField.placeholder = "물주세용"
        waterTextField.textAlignment = .center
        waterTextField.keyboardType = .numberPad
        
        waterButton.addTarget(self, action: #selector(waterButtonClicked), for: .touchUpInside)
        waterButton.setTitle("물먹기", for: .normal)
        waterButton.setImage(Constant.Image.water, for: .normal)
        waterButton.tintColor = Constant.Color.contentColor
        waterButton.layer.cornerRadius = 5
        waterButton.layer.borderWidth = 1.3
        waterButton.layer.borderColor = Constant.Color.contentColor.cgColor
    }
    
    @objc func riceButtonClicked(){
        guard let tama else { return }
        
        let input = riceTextField.text!
        riceTextField.text = ""

        let quantity: Int
        
        if input.isEmpty {
            quantity = 1
        }else{
            guard let result = Int(input), result <= TamaResult.riceLimit else {
                alert("알림", "밥은 한번에 \(TamaResult.riceLimit)개까지 먹을 수 있어요", .alert)
                return
            }
            
            quantity = result
        }
        
        tama.eatRice(quantity)
        updateUI()
    }
    
    @objc func waterButtonClicked(){
        guard let tama else { return }

        let input = waterTextField.text!
        waterTextField.text = ""
        
        let quantity: Int
        
        if input.isEmpty {
            quantity = 1
        }else{
            guard let result = Int(input), result <= TamaResult.waterLimit else {
                alert("알림", "물은 한번에 \(TamaResult.waterLimit)개까지 먹을 수 있어요", .alert)
                return
            }
            
            quantity = result
        }
        
        tama.drinkWater(quantity)
        updateUI()
    }
    
    func configureData(){
        guard let tama else { return }
        tamaImageView.image = tama.tamaImage
        nameLabel.text = tama.name
        descriptionLabel.text = tama.description
        mentLabel.text = tama.ment
    }
    
    func updateUI(){
        tamaImageView.image = tama!.tamaImage
        descriptionLabel.text = tama!.description
        mentLabel.text = tama!.ment
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

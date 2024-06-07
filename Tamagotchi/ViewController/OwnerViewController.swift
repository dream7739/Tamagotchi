//
//  OwnerViewController.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/7/24.
//

import UIKit
import SnapKit

class OwnerViewController: UIViewController {
    
    let ownerTextField = UITextField()
    
    let validLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView("대장님 이름 정하기")
        configureNav()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureNav(){
        let item = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem = item
        navigationController?.navigationBar.tintColor = .contentColor
    }
    
    @objc func saveButtonClicked(){
        //저장을 누르면 대장님 이름이 변경되면서 pop
        //대장 이름은 2~6글자제한
        //최대 글자는 textFieldDelegate 사용
        //2글자 이하인 경우 validLabel에 표시
        
        let input = ownerTextField.text!
        
        if input.trimmingCharacters(in: .whitespaces).count < 2 {
            validLabel.text = "닉네임은 2글자에서 6글자 사이입니다"
        }else{
            TamaResult.ownerName = ownerTextField.text!
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    func configureHierarchy(){
        view.addSubview(ownerTextField)
        view.addSubview(validLabel)
    }
    
    func configureLayout(){
        ownerTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        validLabel.snp.makeConstraints { make in
            make.top.equalTo(ownerTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(ownerTextField)
        }
    }
    
    func configureUI(){
        
        ownerTextField.delegate = self
        
        ownerTextField.borderStyle = .roundedRect
        ownerTextField.text = TamaResult.ownerName
        ownerTextField.placeholder = "대장님 이름을 입력해주세요"
        ownerTextField.font = TamaFont.primary.medium()
        ownerTextField.textColor = .contentColor
        ownerTextField.clearButtonMode = .whileEditing
        ownerTextField.tintColor = .contentColor
        
        validLabel.font = TamaFont.secondary.regular()
        validLabel.textColor = .contentColor
        
    }
    
    
}

extension OwnerViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b") 
            if isBackSpace == -92 {
                return true //백스페이스면 동작
            }
        }
        
        guard textField.text!.count < 6 else { return false }
        return true
    }
}

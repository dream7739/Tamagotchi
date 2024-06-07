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
        //대장 이름은 2~6글자
        TamaResult.ownerName = ownerTextField.text!
        navigationController?.popViewController(animated: true)
    }
    
    func configureHierarchy(){
        view.addSubview(ownerTextField)
    }
    
    func configureLayout(){
        ownerTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
    }

    func configureUI(){
        ownerTextField.borderStyle = .roundedRect
        ownerTextField.text = TamaResult.ownerName
        ownerTextField.placeholder = "대장님 이름을 입력해주세요"
        ownerTextField.font = TamaFont.primary.medium()
        ownerTextField.textColor = .contentColor
        ownerTextField.clearButtonMode = .whileEditing
        ownerTextField.tintColor = .contentColor
    }
   

}

extension OwnerViewController : UITextViewDelegate {
    
}

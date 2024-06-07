//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/7/24.
//

import UIKit 
import SnapKit

enum Setting : Int, CaseIterable {
    case name = 0
    case change = 1
    case reset = 2
    
    var title: String {
        switch self {
        case .name:
            return "내 이름 설정하기"
        case .change:
            return "다마고치 변경하기"
        case .reset:
            return "데이터 초기화"
        }
    }
    
    var subtitle: String {
        switch self{
        case .name:
            return TamaResult.ownerName
        case .change, .reset:
            return ""
        }
    }
    
    var image : UIImage {
        switch self {
        case .name:
            return .nameIcon
        case .change:
            return .changeIcon
        case .reset:
            return .resetIcon
        }
    }
    
}

class SettingViewController: UIViewController {
    
    let settingTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        settingTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView("설정")
        configureNav()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureTableView()
    }
    
    func configureNav(){
        let item = UIBarButtonItem(image: .back, style: .plain, target: self, action: #selector(backButtonClicked))
        navigationItem.leftBarButtonItem = item
        navigationController?.navigationBar.tintColor = .contentColor
    }
    
    @objc func backButtonClicked(){
        navigationController?.popViewController(animated: true)
    }
    
    func configureHierarchy(){
        view.addSubview(settingTableView)
    }
    
    func configureLayout(){
        settingTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI(){
        settingTableView.backgroundColor = .themeColor
        settingTableView.tintColor = .contentColor
    }
    
    func configureTableView(){
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        settingTableView.rowHeight = 50
        
    }
    
}

extension SettingViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        
        let item = Setting(rawValue: indexPath.row)!
        
        cell.configureData(item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idx = indexPath.row
        
        switch idx {
        case 0:
            let vc = OwnerViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            print("초기화 할거에요")
        default:
            print("Error Value")
        }
    }
    
    
}

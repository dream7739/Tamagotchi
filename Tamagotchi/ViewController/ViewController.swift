//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let tamaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let list = TamaResult.tamaList
    
    var viewType: ViewType = .select
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(viewType.title)
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy(){
        view.addSubview(tamaCollectionView)
    }
    
    func configureLayout(){
        tamaCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI(){
        tamaCollectionView.delegate = self
        tamaCollectionView.dataSource = self
        tamaCollectionView.register(TamaCollectionViewCell.self, forCellWithReuseIdentifier: TamaCollectionViewCell.identifier)
        
        tamaCollectionView.backgroundColor = .themeColor
        tamaCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    }


}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TamaCollectionViewCell.identifier, for: indexPath) as! TamaCollectionViewCell
        let data = list[indexPath.row]
        cell.configureData(data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.size.width - 80) / 3
        let height = (collectionView.frame.size.height - 60) / 5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tama = list[indexPath.row]
        
        if tama.type != .ready {
            let detailVC = DetailViewController()
            detailVC.tama = tama
            
            let nav = UINavigationController(rootViewController: detailVC)
            nav.modalPresentationStyle = .overFullScreen
            
            present(nav, animated: true)
        }
    }
    
}

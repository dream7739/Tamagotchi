//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit

enum TamaType: Int, CaseIterable {
    case tingle = 1  //따끔따끔 다마고치
    case smile = 2   //방실방실 다마고치
    case twinkle = 3 //반짝반짝 다마고치
    case ready       //준비중
    
    var tamaName: String {
        switch self {
        case .tingle:
            return "따끔따끔 다마고치"
        case .smile:
            return "방실방실 다마고치"
        case .twinkle:
            return "반짝반짝 다마고치"
        case .ready:
            return "준비중이에요"
        }
    }
    
}

//다마고치는 이름이 있음
//다마고치는 레벨이 있음 (레벨은 1-10까지. 밥알 개수와 물방울 개수에 따라 성장)
//수식 : (밥알개수 / 5) + (물방울 개수 / 2)
//다마고치는 밥을 먹을 수 있음 = 처음엔 0
//다마고치는 물을 먹을 수 있음 = 처음엔 0
//다마고치는 이미지를 가짐. 이미지는 레벨에 따라 변경됨

struct Tamagotchi {
    var type: TamaType
    var name: String
    var rice: Int = 0
    var water: Int = 0
    
    var level: Int {
        let result = (rice / 5) + (water / 2)
        switch result {
        case 0..<10:
            return 1
        case 10..<99:
            return result / 10
        case 100... :
            return 10
        default:
            return 1
        }
    }
    
    
    var tamaImage: UIImage{
        let imageName = "\(type.rawValue)-\(level)"
        
        if let image = UIImage(named: imageName){
            return image
        } else {
            return UIImage(named: "noImage")!
        }
    }
    
}


struct TamaResult {
    static var tamaList: [Tamagotchi] = [
        Tamagotchi(type: TamaType.tingle, name: TamaType.tingle.tamaName),
        Tamagotchi(type: TamaType.smile, name: TamaType.smile.tamaName),
        Tamagotchi(type: TamaType.twinkle, name: TamaType.twinkle.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName), 
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName), Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
    ]
}

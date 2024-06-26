//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit

protocol TamaFeed {
    func drinkWater(_ quantity: Int)
    func eatRice(_ quantity: Int)
    func resetFeed()
}

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
    
    var desciption: String {
        switch self {
        case .tingle:
            return "저는 \(tamaName)입니당 키는 30cm 몸무게는 130톤이에용!\n성격은 화끈하고 잘 날라다닙니다~\n열심히 잘먹고 잘 클 자신은 있답니다 따끔따끔"
        case .smile:
            return "저는 \(tamaName)입니당 키는 40cm 몸무게는 140톤이에용!\n성격은 화끈하고 잘 날라다닙니다~\n열심히 잘먹고 잘 클 자신은 있답니다 방실방실"
        case .twinkle:
            return "저는 \(tamaName)입니당 키는 50cm 몸무게는 150톤이에용!\n성격은 화끈하고 잘 날라다닙니다~\n열심히 잘먹고 잘 클 자신은 있답니다 반짝반짝"
        case .ready:
            return ""
        }
    }
    
}

class Tamagotchi: TamaFeed {
    
    init(type: TamaType, name: String) {
        self.type = type
        self.name = name
    }
    
    var type: TamaType
    
    var name: String
    
    var rice: Int = 0
    
    var water: Int = 0
    
    var ment : String {
        return "\(TamaManager.owner)님 " + TamaResult.randomMent.randomElement()!
    }
    
    var description: String {
        return "LV\(level) ᐧ 밥알 \(rice)개 ᐧ 물방울 \(water)개"
    }
    
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
        var imageName = ""

        //레벨이 10일때는 이미지를 9레벨 이미지와 함께 사용(1-9, 2-9, 3-9)
        if level < 10 {
            imageName = "\(type.rawValue)-\(level)"
        }else if level == 10 {
            imageName = "\(type.rawValue)-\(level-1)"
        }
        
        if let image = UIImage(named: imageName){
            return image
        } else {
            return UIImage(named: "noImage")!
        }
    }
    
    func drinkWater(_ quantity: Int) {
        water += quantity
    }
    
    func eatRice(_ quantity: Int){
        rice += quantity
    }
    
    func resetFeed(){
        water = 0
        rice = 0
    }
    
}

class TamaResult {
    private init(){ }
    
    static let riceLimit = 99
    
    static let waterLimit = 49
    
    static let randomMent : [String] = [
        "과제하셨어용?",
        "깃허브 푸시하셨어용?",
        "배고파용 ㅠㅠ 밥주세요",
        "테이블뷰 연습하셨어용??",
        "오늘은 왠지 기분이 좋아용",
        "오늘 점심은 뭐에용?",
        "목말라요~~~",
        "루피는 귀여워용ㅎㅎ",
        "졸려용 ㅠ_ㅠ",
        "피자 사주세용",
        "치킨 사주세용",
        "짜장면 먹고싶어용",
        "오늘은 왠지 기분이 좋아용"
    ]
    
    static let tamaList: [Tamagotchi] = [
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
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName),
        Tamagotchi(type: TamaType.ready, name: TamaType.ready.tamaName)
    ]
}

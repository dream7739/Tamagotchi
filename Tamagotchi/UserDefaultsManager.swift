//
//  UserDefaultsManager.swift
//  Tamagotchi
//
//  Created by 홍정민 on 6/7/24.
//

import UIKit

@propertyWrapper
struct UserDefaultsManager<T> {
    let defaultValue: T
    let storage: UserDefaults
    let key: String
    
    var wrappedValue: T {
        get {
            self.storage.object(forKey: key) as? T ?? defaultValue
        }
        set {
            self.storage.set(newValue, forKey: key)
        }
    }
    
}

//저장해야 할 정보
//처음인지, 아닌지
//주인 이름
class TamaManager {
    @UserDefaultsManager(defaultValue: "주인", storage: .standard, key: "owner")
    static var owner: String
    
    @UserDefaultsManager(defaultValue: true, storage: .standard, key: "isInitial")
    static var isInitial: Bool

}

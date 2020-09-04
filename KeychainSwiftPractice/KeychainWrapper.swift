//
//  KeychainWrapper.swift
//  KeychainSwiftPractice
//
//  Created by Mark Kim on 9/3/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import Foundation
import KeychainSwift

class KeychainWrapper {
    
    let keychain = KeychainSwift()
    
    func saveToKeychain(keychainValue: String, key: String) -> Bool {
        keychain.set(keychainValue, forKey: key)
    }
    
    func deleteFromKeychain(key: String) -> Bool {
        keychain.delete(key)
    }
    
    func getFromKeychain(key: String) -> String? {
        return keychain.get(key)
    }
}

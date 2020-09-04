//
//  KeychainSwiftPracticeTests.swift
//  KeychainSwiftPracticeTests
//
//  Created by Mark Kim on 9/3/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import XCTest
@testable import KeychainSwiftPractice

class KeychainSwiftPracticeTests: XCTestCase {
    
    var keychain: KeychainWrapper!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        keychain = KeychainWrapper()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveString() throws {
        let result = keychain.saveToKeychain(keychainValue: "testValue", key: "testKey")
        XCTAssertTrue(result)
    }

    func testGetKeychainValue() throws {
        let keychainValue = keychain.saveToKeychain(keychainValue: "keychainValue", key: "testKey")
        XCTAssertTrue(keychainValue)
        
        let getKeychainValue = keychain.getFromKeychain(key: "testKey")
        XCTAssertEqual(getKeychainValue, "keychainValue")
    }
    
    func testDeleteKeychainValue() throws {
        _ = keychain.saveToKeychain(keychainValue: "testValue", key: "testKey")
        let result = keychain.deleteFromKeychain(key: "testKey")
        XCTAssertTrue(result)
    }

}

//
//  ViewController.swift
//  KeychainSwiftPractice
//
//  Created by Mark Kim on 9/3/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    
    let keychain = KeychainWrapper()
    
    let key = "theKey"
    
    let keyChainTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let saveButton: UIButton = {
        let save = UIButton()
        save.setTitle("Save to Keychain", for: .normal)
        save.setTitleColor(.blue, for: .normal)
        save.addTarget(self, action: #selector(savedButtonTapped), for: .touchUpInside)
        save.translatesAutoresizingMaskIntoConstraints = false
        return save
    }()
    
    let deleteButton: UIButton = {
        let delete = UIButton()
        delete.setTitle("Delete from Keychain", for: .normal)
        delete.setTitleColor(.blue, for: .normal)
        delete.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        delete.translatesAutoresizingMaskIntoConstraints = false
        return delete
    }()
    
    let valueFromKeyChainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpVC()
    }
    
    func setUpVC() {
        updateLabel()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(keyChainTextField)
        view.addSubview(saveButton)
        view.addSubview(deleteButton)
        view.addSubview(valueFromKeyChainLabel)
        NSLayoutConstraint.activate([
            keyChainTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            keyChainTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            keyChainTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            keyChainTextField.heightAnchor.constraint(equalToConstant: 30),
            
            saveButton.topAnchor.constraint(equalTo: keyChainTextField.bottomAnchor, constant: 20),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 30),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            deleteButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            deleteButton.widthAnchor.constraint(equalToConstant: 200),
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            valueFromKeyChainLabel.topAnchor.constraint(equalTo: deleteButton.bottomAnchor, constant: 20),
            valueFromKeyChainLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            valueFromKeyChainLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            valueFromKeyChainLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func savedButtonTapped() {
        if let keyChainValue = keyChainTextField.text {
            keychain.saveToKeychain(keychainValue: keyChainValue, key: key)
            updateLabel()
        }
    }
    
    @objc func deleteButtonTapped() {
        keychain.deleteFromKeychain(key: key)
        updateLabel()
    }
    
    func updateLabel() {
        if let value = keychain.getFromKeychain(key: key) {
            valueFromKeyChainLabel.text = "Keychain Value: \(value)"
        } else {
            valueFromKeyChainLabel.text = "Nothing to see here"
        }
    }

}


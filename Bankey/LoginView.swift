//
//  LoginView.swift
//  Bankey
//
//  Created by Dishant Nagpal on 11/11/23.
//

import Foundation
import UIKit

class LoginView : UIView {
    
    let usernameTextField = UITextField()
    let stackView = UIStackView()
    let passwordTextField = UITextField()
    let divderView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension LoginView {
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        //stackView.distribution = .fillEqually
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        //usernameTextField.backgroundColor = .gray
        usernameTextField.delegate = self
        
        
        divderView.translatesAutoresizingMaskIntoConstraints = false
        divderView.backgroundColor = .secondarySystemFill
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.enablePasswordToggle()
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout(){
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(divderView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            divderView.heightAnchor.constraint(equalToConstant: 1)
            
        
        ])
    }
}


extension LoginView : UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
    
}

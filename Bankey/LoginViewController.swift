//
//  ViewController.swift
//  Bankey
//
//  Created by Dishant Nagpal on 11/11/23.
//

import UIKit


protocol LoginViewControllerDelegate : AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate : LoginViewControllerDelegate?
    
    var userName : String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    //animation
    
    var leadingEdgeOnScreen : CGFloat = 16
    var leadingEdgeOffScreen : CGFloat = -1000
    
    var titleLeadingAnchor : NSLayoutConstraint?
    var descriptionLeadingAnchor : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }

}


extension LoginViewController {
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.isHidden = true
        
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.font = .boldSystemFont(ofSize: 40)
        titleLabel.textAlignment = .center
        titleLabel.alpha = 0
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Your premium source for all things banking!"
        descriptionLabel.font = .boldSystemFont(ofSize: 25)
        descriptionLabel.textAlignment = .center
        descriptionLabel.alpha = 0
    }
    
    private func layout(){
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Title Label
        
        
        // Title
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
            
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleLeadingAnchor?.isActive = true
        
        // Description Label
        
        
        NSLayoutConstraint.activate([
        
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 3),
            descriptionLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            //descriptionLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor)
        
        ])
        
        descriptionLeadingAnchor = descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        descriptionLeadingAnchor?.isActive = true
        
        // LoginView
        NSLayoutConstraint.activate([
        
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 3),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        
        ])
        
        // SignIn Button
        
        NSLayoutConstraint.activate([
        
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 2)
            
        ])
        
        // Error Message Label
        
        NSLayoutConstraint.activate([
        
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
            
        ])
    }
}


//MARK:- Actions

extension LoginViewController {
    
    @objc func signInTapped(sender:UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let userName = userName else {
            assertionFailure("Username should never be nil")
            return
        }
        guard let password = password else {
            assertionFailure("Password should never be nil ")
            return
        }
        
        if userName.isEmpty || password.isEmpty {
            configureView(withMessage:"Username / Password can't be empty")
            return
        }
        
        if userName == "Dishant" && password == "welcome"{
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }else{
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message:String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}

extension LoginViewController {
   private func animate(){
       
       let duration = 1.0
       
       let animator1 = UIViewPropertyAnimator(duration: duration , curve: .easeInOut){
           self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
           //self.descriptionLeadingAnchor?.constant = self.leadingEdgeOnScreen
           self.view.layoutIfNeeded()
       }
       UIView.animate(withDuration: duration,delay: duration) {
           self.descriptionLeadingAnchor?.constant = self.leadingEdgeOnScreen
           self.view.layoutIfNeeded()
       }
       let animator2 = UIViewPropertyAnimator(duration: duration*2, curve: .easeInOut){
           self.titleLabel.alpha = 1
           self.view.layoutIfNeeded()
       }
       UIView.animate(withDuration: duration*2, delay: 1.2) {
           self.descriptionLabel.alpha = 1
           self.view.layoutIfNeeded()
       }
       animator1.startAnimation()
       animator2.startAnimation(afterDelay: 0.2)
       
    }
    
    
}

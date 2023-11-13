//
//  DummyViewController.swift
//  Bankey
//
//  Created by Dishant Nagpal on 13/11/23.
//
import UIKit

protocol DummyViewControllerDelegate : AnyObject {
    func didLogout()
}

class DummyViewController : UIViewController {
    
    let logoutButton = UIButton()
    let welcomeLabel = UILabel()
    let stackView = UIStackView()
    
    weak var delegate : DummyViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
    
}


extension DummyViewController {
    
    func style(){
        
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(logoutButton)
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
    
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = .boldSystemFont(ofSize: 30)
        welcomeLabel.textAlignment = .center
        
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.configuration = .filled()
        logoutButton.configuration?.baseBackgroundColor = .systemBlue
        logoutButton.configuration?.imagePadding = 8
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
        
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
    
    @objc func logoutTapped(sender: UIButton){
        delegate?.didLogout()
    }
}


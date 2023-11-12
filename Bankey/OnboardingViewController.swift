//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Dishant Nagpal on 12/11/23.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    var heroImage : String
    var titleText : String
    
    init(heroImage:String,titleText:String){
        
        self.heroImage = heroImage
        self.titleText = titleText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
    
    private func style(){
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .center
        //stackView.distribution = .fillEqually
        
        imageView.image = UIImage(named: heroImage)
        imageView.contentMode = .scaleAspectFill
        
        
        label.text = titleText
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
    }
    private func layout(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
        
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        
        ])
        
    }
}


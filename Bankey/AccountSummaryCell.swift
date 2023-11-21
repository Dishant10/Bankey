//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Dishant Nagpal on 17/11/23.
//

import Foundation
import UIKit


class AccountSummaryCell : UITableViewCell {
    
    
    enum AccountType : String {
        case Banking
        case CreditCard
        case Investment
    }
    
    struct ViewModel {
        let accountType : AccountType
        let accountName : String
        let balance : Decimal
        
        var balanceAsAttributedString: NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
        
    }
    
    let viewModel : ViewModel? = nil
    
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID : String = "AccountSummary"
    static let rowHeight : CGFloat = 115
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AccountSummaryCell {
    private func setup(){
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.text = "Account Type"
        typeLabel.numberOfLines = 0
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        contentView.addSubview(typeLabel)
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = appColor
        
        contentView.addSubview(underlineView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.text = "Account Name"
        
        contentView.addSubview(nameLabel)
        
        balanceStackView.axis = .vertical
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.text = "Some balance"
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel .adjustsFontSizeToFitWidth = true
        balanceLabel.textAlignment = .right
        
        balanceStackView.addArrangedSubview(balanceLabel)
        
        self.balanceAmountLabel.attributedText = makeFormattedBalance(dollars: "XXX,XXX", cents: "XX")
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .right
        
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        contentView.addSubview(balanceStackView)
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")?.withTintColor(appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        
        contentView.addSubview(chevronImageView)
        
    }
    private func layout(){
        NSLayoutConstraint.activate([
            
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 2),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underlineView.heightAnchor.constraint(equalToConstant: 5),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            nameLabel.topAnchor.constraint(equalTo: underlineView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
            balanceStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: nameLabel.trailingAnchor, multiplier: 4),
            chevronImageView.centerYAnchor.constraint(equalTo: balanceStackView.centerYAnchor),
            chevronImageView.leadingAnchor.constraint(equalTo: balanceStackView.trailingAnchor, constant: 16),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
            
        ])
    }
}


extension AccountSummaryCell {
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}


extension AccountSummaryCell {
    func configure(with vm : ViewModel){
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        balanceAmountLabel.attributedText = vm.balanceAsAttributedString
        switch vm.accountType {
        case .Banking:
            underlineView.backgroundColor = appColor
            balanceLabel.text = "Current Balance"
        case .CreditCard:
            underlineView.backgroundColor = .systemOrange
            balanceLabel.text = "Current Balance"
        case .Investment:
            underlineView.backgroundColor = .systemPurple
            balanceLabel.text = "Value"
        }
    }
}

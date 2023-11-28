//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Dishant Nagpal on 17/11/23.
//

import UIKit


class AccountSummaryHeaderView : UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var welcomeLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    let shakeyBell = ShakeyBellView()
    
    struct ViewModel {
        let welcomeMessage : String
        let name : String
        let date : Date
        
        var dateFormatted : String {
            return date.monthDayYearString
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 156)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: AccountSummaryHeaderView.self)
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = appColor
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        setupShakeyBell()
    }
    
    private func setupShakeyBell(){
        shakeyBell.translatesAutoresizingMaskIntoConstraints = false
        addSubview(shakeyBell)
        
        NSLayoutConstraint.activate([
        
            shakeyBell.trailingAnchor.constraint(equalTo: trailingAnchor),
            shakeyBell.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    func configure(viewModel : ViewModel){
        welcomeLabel.text = viewModel.welcomeMessage
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.dateFormatted
    }
    
}



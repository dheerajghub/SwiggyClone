//
//  SectionHeaderView_2.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 01/02/22.
//

import UIKit

class SectionHeaderView_2: UICollectionReusableView {
        
    // MARK: PROPERTIES -
    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.text = "vegetarian options".uppercased()
        l.font = UIFont.customFont(ofType: .bold, withSize: 16)
        l.textAlignment = .center
        return l
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        backgroundColor = .clear
        addSubview(title)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}

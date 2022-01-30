//
//  SectionHeaderView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    // MARK: PROPERTIES -
    
    let dividerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        return v
    }()
    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Restaurants Curated For"
        l.font = UIFont.systemFont(ofSize: 16, weight: .medium)
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
        addSubview(dividerView)
        addSubview(title)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            dividerView.topAnchor.constraint(equalTo: topAnchor),
            
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            title.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

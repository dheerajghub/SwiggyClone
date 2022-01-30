//
//  FoodVCFilterHeader.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import UIKit

class FoodFilterHeaderView: UICollectionReusableView {
        
    // MARK: PROPERTIES -
    
    var leadingConstraints: NSLayoutConstraint?
    var trailingConstraints: NSLayoutConstraint?
    
    var isStickHeader: Bool? {
        didSet {
            guard let isStickHeader = isStickHeader else {
                return
            }

            if isStickHeader {
                dividerView.isHidden = false
                trailingConstraints?.constant = -17
                leadingConstraints?.constant = 17
            } else {
                dividerView.isHidden = true
                leadingConstraints?.constant = 2
                trailingConstraints?.constant = -2
            }
        }
    }
    
    let title:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "All Restaurants".uppercased()
        l.textColor = .black.withAlphaComponent(0.8)
        l.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return l
    }()
    
    let settingsIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "ic_setting")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .darkGray
        return img
    }()
    
    let filterBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sort/Filter", for: .normal)
        btn.setTitleColor(.black.withAlphaComponent(0.8), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return btn
    }()
    
    let dividerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .gray.withAlphaComponent(0.4)
        v.isHidden = true
        return v
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        addSubview(title)
        addSubview(settingsIcon)
        addSubview(filterBtn)
        addSubview(dividerView)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.trailingAnchor.constraint(equalTo: filterBtn.leadingAnchor, constant: -10),
            
            filterBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.7),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            settingsIcon.widthAnchor.constraint(equalToConstant: 25),
            settingsIcon.heightAnchor.constraint(equalToConstant: 25),
            settingsIcon.trailingAnchor.constraint(equalTo: filterBtn.leadingAnchor, constant: -3),
            settingsIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        leadingConstraints = title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2) // or 17
        leadingConstraints?.isActive = true
        
        
        trailingConstraints = filterBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2) // or -17
        trailingConstraints?.isActive = true
        
    }
    
}

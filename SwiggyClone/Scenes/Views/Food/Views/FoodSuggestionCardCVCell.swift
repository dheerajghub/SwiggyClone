//
//  FoodSuggestionCardCVCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 30/01/22.
//

import UIKit

class FoodSuggestionCardCVCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    
    let cardImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 42.5
        img.backgroundColor = .black
        return img
    }()
    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 2
        l.text = "Cakes & desserts".uppercased()
        l.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        l.textAlignment = .center
        return l
    }()
    
    let subtitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        l.textColor = .gray
        l.textAlignment = .center
        l.text = "0 Options".uppercased()
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
        addSubview(cardImage)
        addSubview(title)
        addSubview(subtitle)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            cardImage.widthAnchor.constraint(equalToConstant: 85),
            cardImage.topAnchor.constraint(equalTo: topAnchor),
            cardImage.heightAnchor.constraint(equalToConstant: 85),
            cardImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 5),
            title.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -5),
            
            subtitle.bottomAnchor.constraint(equalTo: bottomAnchor),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

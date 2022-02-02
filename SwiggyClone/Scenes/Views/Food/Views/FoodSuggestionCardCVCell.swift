//
//  FoodSuggestionCardCVCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 30/01/22.
//

import UIKit

class FoodSuggestionCardCVCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    
    var data: CuratedRestaurantModel? {
        didSet {
            guard let data = data else { return }
            cardImage.image = UIImage(named: data.image)
            title.text = data.title.uppercased()
            subtitle.text = "\(data.options) options".uppercased()
        }
    }
    
    let cardImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 2
        l.font = UIFont.customFont(ofType: .bold, withSize: 12)
        l.textAlignment = .center
        l.textColor = .black.withAlphaComponent(0.8)
        return l
    }()
    
    let subtitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.customFont(ofType: .regular, withSize: 10)
        l.textColor = .gray
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

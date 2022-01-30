//
//  FoodCategoryCVCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import UIKit

class FoodCategoryCVCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    
    let categoryImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .black
        return img
    }()
    
    let categoryLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "category name".capitalized
        l.font = UIFont.systemFont(ofSize: 11)
        l.numberOfLines = 2
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
        addSubview(categoryImage)
        addSubview(categoryLabel)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            categoryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            categoryImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            categoryImage.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            categoryImage.heightAnchor.constraint(equalToConstant: 45),
            
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            categoryLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: 3)
        ])
    }
    
}

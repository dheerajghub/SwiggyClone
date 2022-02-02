//
//  FoodCategoryCVCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import UIKit

class FoodCategoryCVCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    
    var data: FoodCategoryDataModel? {
        didSet {
            guard let data = data else { return }
            categoryImage.image = UIImage(named: data.categoryImage)
            categoryLabel.text = data.categoryName.capitalized
        }
    }
    
    let categoryImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let categoryLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.customFont(ofType: .light, withSize: 10)
        l.numberOfLines = 2
        l.textColor = .black.withAlphaComponent(0.8)
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

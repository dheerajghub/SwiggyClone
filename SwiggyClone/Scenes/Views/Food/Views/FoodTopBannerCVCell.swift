//
//  FoodTopBannerCVCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import UIKit

class FoodTopBannerCVCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    
    let bannerImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .black
        img.layer.cornerRadius = 5
        return img
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
        addSubview(bannerImage)
    }
    
    func setUpConstraints(){
        bannerImage.pin(to: self)
    }
    
}

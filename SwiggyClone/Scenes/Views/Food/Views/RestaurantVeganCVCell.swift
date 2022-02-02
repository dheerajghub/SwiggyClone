//
//  RestaurantVeganCVCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 01/02/22.
//

import UIKit

class RestaurantVeganCVCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    
    var data: VeganRestaurantSectionModel? {
        didSet {
            guard let data = data else { return }
            restaurantImage.image = UIImage(named: data.coverImage)
            title.text = data.restaurantName
            subtitle.text = data.categoryTags
        }
    }
    
    let restaurantImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Restaurant Name"
        l.font = UIFont.customFont(ofType: .regular, withSize: 15)
        l.textColor = .black
        l.textAlignment = .center
        return l
    }()
    
    let dividerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        return v
    }()
    
    let subtitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "North India, Punjabi"
        l.font = UIFont.customFont(ofType: .regular, withSize: 13)
        l.textColor = .gray
        l.textAlignment = .center
        l.numberOfLines = 0
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
        addSubview(restaurantImage)
        addSubview(title)
        addSubview(dividerView)
        addSubview(subtitle)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print(self.frame.size.width)
        }
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            restaurantImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantImage.heightAnchor.constraint(equalToConstant: 145),
            restaurantImage.topAnchor.constraint(equalTo: topAnchor),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: restaurantImage.bottomAnchor, constant: 30),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dividerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 30),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 25),
            
            subtitle.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 15),
            subtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

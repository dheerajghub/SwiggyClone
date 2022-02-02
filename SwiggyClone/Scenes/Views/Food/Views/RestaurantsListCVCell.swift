//
//  RestaurantsListCVCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 30/01/22.
//

import UIKit

class RestaurantsListCVCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    
    var benefitHeightContraints: NSLayoutConstraint?
    var locationLabelBottomConstraints: NSLayoutConstraint?
    
    var data: RestaurantListDataModel? {
        didSet {
            guard let data = data else { return }
            restaurantNameLabel.text = data.restaurantName
            restaurantImageCover.image = UIImage(named: data.restaurantCoverImage)
            offerLabel.attributedText = setOfferAttributedLabel(withTitle: "60% Off", withSubtitle: "upto ₹120")
            restaurantInfoLabel.attributedText = setRestaurantInfoLabel(withRating: data.rating, withTime: "\(data.time) mins", withDesc: data.description)
            restaurantTagLabel.text = data.tags
            restaurantLocationLabel.text = data.location
            if data.isFreeDelivery {
                locationLabelBottomConstraints?.constant = -8
                benefitHeightContraints?.constant = 30
                benefitLabel.text = data.benefitDesc.uppercased()
            } else {
                locationLabelBottomConstraints?.constant = -30
                benefitHeightContraints?.constant = 0
                benefitLabel.text = ""
            }
            
        }
    }
    
    let restaurantImageCard: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let restaurantImageCover: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 8
        img.clipsToBounds = true
        return img
    }()
    
    let offerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 5
        v.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        v.layer.borderWidth = 0.7
        
        v.layer.shadowColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 4)
        v.layer.shadowOpacity = 1
        v.layer.shadowRadius = 5
        
        return v
    }()
    
    let offerLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.numberOfLines = 2
        return l
    }()
    
    let restaurantNameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font = UIFont.customFont(ofType: .bold, withSize: 15)
        return l
    }()
    
    let restaurantInfoLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let restaurantTagLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.customFont(ofType: .regular, withSize: 13)
        l.textColor = .darkGray.withAlphaComponent(0.8)
        return l
    }()
    
    let restaurantLocationLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .darkGray.withAlphaComponent(0.8)
        l.font = UIFont.customFont(ofType: .regular , withSize: 13)
        return l
    }()
    
    let benefitView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 8
        v.layer.cornerCurve = .continuous
        v.layer.masksToBounds = true
        return v
    }()
    
    let gradientView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let benefitIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "ic_benefit")
        return img
    }()
    
    let benefitLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = Colors.appOrange
        l.font = UIFont.customFont(ofType: .condBold, withSize: 13)
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
        addSubview(restaurantImageCard)
        restaurantImageCard.addSubview(restaurantImageCover)
        addSubview(offerView)
        offerView.addSubview(offerLabel)
        addSubview(restaurantNameLabel)
        addSubview(restaurantInfoLabel)
        addSubview(restaurantTagLabel)
        addSubview(restaurantLocationLabel)
        
        addSubview(benefitView)
        benefitView.addSubview(gradientView)
        benefitView.addSubview(benefitIcon)
        benefitView.addSubview(benefitLabel)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            gradientView.setGradient(withColors: [UIColor.white.withAlphaComponent(0).cgColor, Colors.appOrange.withAlphaComponent(0.2).cgColor], startPoint: CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint(x: 1.0, y: 1.0))
        }
    }
    
    func setUpConstraints(){
        restaurantImageCover.pin(to: restaurantImageCard)
        offerLabel.pin(to: offerView)
        gradientView.pin(to: benefitView)
        NSLayoutConstraint.activate([
            restaurantImageCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantImageCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            restaurantImageCard.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            restaurantImageCard.widthAnchor.constraint(equalToConstant: 100),
            
            offerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            offerView.leadingAnchor.constraint(equalTo: restaurantImageCard.leadingAnchor, constant: 5),
            offerView.trailingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: -5),
            offerView.heightAnchor.constraint(equalToConstant: 32),
            
            restaurantNameLabel.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantNameLabel.bottomAnchor.constraint(equalTo: restaurantInfoLabel.topAnchor, constant: -3),
            
            restaurantInfoLabel.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantInfoLabel.bottomAnchor.constraint(equalTo: restaurantTagLabel.topAnchor, constant: -5),
            
            restaurantTagLabel.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantTagLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantTagLabel.bottomAnchor.constraint(equalTo: restaurantLocationLabel.topAnchor, constant: -8),
            
            restaurantLocationLabel.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            benefitView.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            benefitView.trailingAnchor.constraint(equalTo: trailingAnchor),
            benefitView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            benefitLabel.leadingAnchor.constraint(equalTo: benefitView.leadingAnchor, constant: 5),
            benefitLabel.trailingAnchor.constraint(equalTo: benefitView.trailingAnchor, constant: -5),
            benefitLabel.centerYAnchor.constraint(equalTo: benefitView.centerYAnchor),
            
            benefitIcon.trailingAnchor.constraint(equalTo: benefitView.trailingAnchor, constant: -5),
            benefitIcon.centerYAnchor.constraint(equalTo: benefitView.centerYAnchor),
            benefitIcon.widthAnchor.constraint(equalToConstant: 40),
            benefitIcon.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        benefitHeightContraints = benefitView.heightAnchor.constraint(equalToConstant: 30)
        benefitHeightContraints?.isActive = true
        
        locationLabelBottomConstraints = restaurantLocationLabel.bottomAnchor.constraint(equalTo: benefitView.topAnchor, constant: -8)
        locationLabelBottomConstraints?.isActive = true
        
    }
    
    func setOfferAttributedLabel(withTitle title: String, withSubtitle subtitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title.uppercased(), attributes: [NSAttributedString.Key.font: UIFont.customFont(ofType: .bold, withSize: 13) , NSAttributedString.Key.foregroundColor: Colors.appOrange]))
        attributedText.append(NSAttributedString(string: "\n• \(subtitle) •".uppercased(), attributes: [NSAttributedString.Key.font: UIFont.customFont(ofType: .regular, withSize: 7) , NSAttributedString.Key.foregroundColor: Colors.appOrange]))
        return attributedText
    }
    
    func setRestaurantInfoLabel(withRating rating: Float, withTime time: String , withDesc desc: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string:"")
        
        let fontSize = 13.0
        let fontColor = UIColor.darkGray
        let font = UIFont.customFont(ofType: .regular, withSize: fontSize)
        
        // Star Icon
        let starImg = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        let starImage = NSTextAttachment()
        starImage.image = starImg?.withTintColor(fontColor)
        starImage.bounds = CGRect(x: 0, y: (font.capHeight - fontSize).rounded() / 2, width: fontSize, height: fontSize)
        starImage.setImageHeight(height: fontSize)
        let imgString = NSAttributedString(attachment: starImage)
        attributedText.append(imgString)
        
        attributedText.append(NSAttributedString(string: "  \(rating)  •  \(time)  •  \(desc)" , attributes:[NSAttributedString.Key.font: font , NSAttributedString.Key.foregroundColor: fontColor]))
        
        return attributedText
    }
    
}

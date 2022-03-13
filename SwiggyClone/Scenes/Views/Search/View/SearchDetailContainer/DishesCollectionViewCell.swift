//
//  DishesCollectionViewCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 12/03/22.
//

import UIKit

class DishesCollectionViewCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    
    var data: DishesListModel! {
        didSet {
            manageUI()
        }
    }
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    /// Basic Info
    
    let basicInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let basicInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let dashDividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
    let arrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_back2")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = .gray
        button.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        return button
    }()
    
    ///:
    
    /// Dish Preview Card

    let dishPreviewCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dishPreviewImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("add".uppercased(), for: .normal)
        button.setTitleColor(Colors.appGreen, for: .normal)
        button.titleLabel?.font = .customFont(ofType: .bold, withSize: 16)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.withAlphaComponent(0.4).cgColor
        
        button.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 1
        
        return button
    }()
    
    let customizableStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofType: .regular, withSize: 10)
        label.text = "Customizable"
        label.textColor = .gray.withAlphaComponent(0.8)
        return label
    }()
    
    ///:
    
    /// Dish Detail Info 
    
    let dishDetailInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    ///:
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
            let startPoint = CGPoint(x: dashDividerView.bounds.minX , y: dashDividerView.bounds.minY)
            let endPoint = CGPoint(x: dashDividerView.bounds.maxX, y: dashDividerView.bounds.minY)

            dashDividerView.drawDottedLine(start: startPoint, end: endPoint, color: .gray.withAlphaComponent(0.8))
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        backgroundColor = .clear
        addSubview(cardView)
        cardView.addSubview(basicInfoView)
        basicInfoView.addSubview(dashDividerView)
        basicInfoView.addSubview(arrowButton)
        basicInfoView.addSubview(basicInfoLabel)
        
        addSubview(dishPreviewCard)
        dishPreviewCard.addSubview(dishPreviewImage)
        dishPreviewCard.addSubview(addButton)
        dishPreviewCard.addSubview(customizableStatusLabel)
        
        addSubview(dishDetailInfoLabel)
    }
    
    func setUpConstraints(){
        cardView.pin(to: self)
        NSLayoutConstraint.activate([
            basicInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            basicInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicInfoView.topAnchor.constraint(equalTo: topAnchor),
            basicInfoView.heightAnchor.constraint(equalToConstant: 80),
            
            dashDividerView.leadingAnchor.constraint(equalTo: basicInfoView.leadingAnchor, constant: 20),
            dashDividerView.trailingAnchor.constraint(equalTo: basicInfoView.trailingAnchor, constant: -20),
            dashDividerView.heightAnchor.constraint(equalToConstant: 2),
            dashDividerView.bottomAnchor.constraint(equalTo: basicInfoView.bottomAnchor),
            
            arrowButton.trailingAnchor.constraint(equalTo: basicInfoView.trailingAnchor, constant: -20),
            arrowButton.centerYAnchor.constraint(equalTo: basicInfoView.centerYAnchor),
            arrowButton.widthAnchor.constraint(equalToConstant: 25),
            arrowButton.heightAnchor.constraint(equalToConstant: 25),
            
            basicInfoLabel.leadingAnchor.constraint(equalTo: basicInfoView.leadingAnchor, constant: 20),
            basicInfoLabel.trailingAnchor.constraint(equalTo: arrowButton.leadingAnchor, constant: -20),
            basicInfoLabel.centerYAnchor.constraint(equalTo: basicInfoView.centerYAnchor),
            
            dishPreviewCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            dishPreviewCard.bottomAnchor.constraint(equalTo: bottomAnchor),
            dishPreviewCard.topAnchor.constraint(equalTo: basicInfoView.bottomAnchor, constant: 20),
            dishPreviewCard.widthAnchor.constraint(equalToConstant: 120),
            
            dishPreviewImage.topAnchor.constraint(equalTo: dishPreviewCard.topAnchor),
            dishPreviewImage.leadingAnchor.constraint(equalTo: dishPreviewCard.leadingAnchor),
            dishPreviewImage.trailingAnchor.constraint(equalTo: dishPreviewCard.trailingAnchor),
            dishPreviewImage.heightAnchor.constraint(equalToConstant: 90),
            
            addButton.topAnchor.constraint(equalTo: dishPreviewCard.topAnchor, constant: 82.5),
            addButton.leadingAnchor.constraint(equalTo: dishPreviewCard.leadingAnchor, constant: 15),
            addButton.trailingAnchor.constraint(equalTo: dishPreviewCard.trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 35),
            
            customizableStatusLabel.centerXAnchor.constraint(equalTo: dishPreviewCard.centerXAnchor),
            customizableStatusLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8),
            
            dishDetailInfoLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            dishDetailInfoLabel.topAnchor.constraint(equalTo: basicInfoView.bottomAnchor, constant: 10),
            dishDetailInfoLabel.trailingAnchor.constraint(equalTo: dishPreviewCard.leadingAnchor, constant: -20),
            dishDetailInfoLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20)
        ])
    }
    
    func setBasicInfoLabel(withTitle: String, withRating rating: Float, withTime time: String , withDesc desc: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string:"\(withTitle)\n" , attributes:[NSAttributedString.Key.font: UIFont.customFont(ofType: .bold, withSize: 15) , NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let fontSize = 13.0
        let fontColor = UIColor.gray
        let font = UIFont.customFont(ofType: .regular, withSize: fontSize)
        
        // Star Icon
        let starImg = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        let starImage = NSTextAttachment()
        starImage.image = starImg?.withTintColor(fontColor)
        starImage.bounds = CGRect(x: 0, y: (font.capHeight - fontSize).rounded() / 2, width: fontSize, height: fontSize)
        starImage.setImageHeight(height: fontSize)
        let imgString = NSAttributedString(attachment: starImage)
        attributedText.append(imgString)
        
        attributedText.append(NSAttributedString(string: "  \(rating)  •  \(time)" , attributes:[NSAttributedString.Key.font: font , NSAttributedString.Key.foregroundColor: fontColor]))
        
        return attributedText
    }
    
    private func setDishDetailInfoLabel(isVeg: Bool, isBestSeller: Bool, withTitle: String, withPrice: Float , withDesc desc: String) -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString(string:"")
        
        /// isVeg or nonVeg
        
        let fontSize = 14.0
        let font = UIFont.customFont(ofType: .bold, withSize: fontSize)
        
        let dishTypeImage = NSTextAttachment()
        dishTypeImage.image = UIImage(named: isVeg ? "ic_veg" : "ic_nonveg")
        dishTypeImage.bounds = CGRect(x: 0, y: (font.capHeight - fontSize).rounded() / 2, width: fontSize, height: fontSize)
        dishTypeImage.setImageHeight(height: fontSize)
        let dishTypeImageString = NSAttributedString(attachment: dishTypeImage)
        attributedText.append(dishTypeImageString)
        
        attributedText.append(NSAttributedString(string: "  "))
        
        if isBestSeller {
            /// Star Icon
            let fontColor = Colors.appGolden
            let starOriginalImage = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
            let starImage = NSTextAttachment()
            starImage.image = starOriginalImage?.withTintColor(fontColor)
            starImage.bounds = CGRect(x: 0, y: (font.capHeight - fontSize).rounded() / 2, width: fontSize, height: fontSize)
            starImage.setImageHeight(height: fontSize)
            let starImageString = NSAttributedString(attachment: starImage)
            attributedText.append(starImageString)
            
            attributedText.append(NSAttributedString(string: " BESTSELLER" , attributes:[NSAttributedString.Key.font: font , NSAttributedString.Key.foregroundColor: fontColor]))
        }
        
        attributedText.append(NSAttributedString(string: "\n"))
        
        attributedText.append(NSAttributedString(string: "\(withTitle)\n" , attributes:[NSAttributedString.Key.font: UIFont.customFont(ofType: .bold, withSize: 16) , NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "₹\(withPrice)\n\n" , attributes:[NSAttributedString.Key.font: UIFont.customFont(ofType: .regular, withSize: 13) , NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "\(desc)" , attributes:[NSAttributedString.Key.font: UIFont.customFont(ofType: .regular, withSize: 12) , NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.8)]))
        
        return attributedText
    }
    
    func manageUI(){
        guard let data = data else { return }
        dishPreviewImage.image = UIImage(named: data.menuImage)
        basicInfoLabel.attributedText = setBasicInfoLabel(withTitle: data.restaurantTitle, withRating: data.ratings, withTime: data.time, withDesc: "")
        dishDetailInfoLabel.attributedText = setDishDetailInfoLabel(isVeg: data.isVeg, isBestSeller: data.isBestSeller, withTitle: data.menuTitle, withPrice: data.price, withDesc: data.desc)
    }
    
}

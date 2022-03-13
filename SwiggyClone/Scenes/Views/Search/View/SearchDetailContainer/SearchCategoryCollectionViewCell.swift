//
//  SearchCategoryCollectionViewCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 13/03/22.
//

import UIKit

class SearchCategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    
    override var isSelected: Bool {
        didSet {
            cardView.backgroundColor = isSelected ? .black : .white
            titleLabel.textColor = isSelected ? .lightGray : .black.withAlphaComponent(0.8)
        }
    }
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 15
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofType: .bold, withSize: 13)
        label.text = "Dishes"
        label.textColor = .black.withAlphaComponent(0.8)
        return label
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
        addSubview(cardView)
        addSubview(titleLabel)
    }
    
    func setUpConstraints(){
        cardView.pin(to: self)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}

//
//  FoodDetailNavView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 12/02/22.
//

import UIKit

protocol FoodDetailNavActionDelegate {
    func didBackBtnTapped()
}

class FoodDetailNavView: UIView {

    // MARK: PROPERTIES -
    
    var delegate: FoodDetailNavActionDelegate?
    
    let coverView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.alpha = 0
        return v
    }()
    
    let cardView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.alpha = 1
        return v
    }()
    
    let backBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .black
        btn.setImage(UIImage(named: "ic_back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .white
        btn.backgroundColor = .black.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 17.5
        btn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    let backBtn2: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "ic_back2")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .black
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 17.5
        btn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Valentine's Special"
        l.textColor = .black.withAlphaComponent(0.7)
        l.font = .customFont(ofType: .regular, withSize: 15)
        return l
    }()
    
    let navCardView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.alpha = 0
        return v
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
        
        addSubview(coverView)
        
        addSubview(navCardView)
        navCardView.addSubview(backBtn2)
        navCardView.addSubview(titleLabel)
        
        addSubview(cardView)
        cardView.addSubview(backBtn)
        
    }
    
    func setUpConstraints(){
        coverView.pin(to: self)
        NSLayoutConstraint.activate([
            navCardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navCardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navCardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            navCardView.topAnchor.constraint(equalTo: topAnchor, constant: windowConstant.getTopPadding + 10),
            
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: windowConstant.getTopPadding + 10),
            
            backBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backBtn.widthAnchor.constraint(equalToConstant: 35),
            backBtn.heightAnchor.constraint(equalToConstant: 35),
            backBtn.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            
            backBtn2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backBtn2.centerYAnchor.constraint(equalTo: navCardView.centerYAnchor),
            backBtn2.widthAnchor.constraint(equalToConstant: 35),
            backBtn2.heightAnchor.constraint(equalToConstant: 35),
            
            titleLabel.leadingAnchor.constraint(equalTo: backBtn2.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: navCardView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    // MARK: - ACTIONS
    
    @objc func backBtnPressed(){
        delegate?.didBackBtnTapped()
    }

}

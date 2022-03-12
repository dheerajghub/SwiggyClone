//
//  SearchContainerView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/03/22.
//

import UIKit

protocol SearchContainerViewActionDelegate {
    func didSearchTextFieldChanged(with text: String)
    func didCloseTapped()
    func didBackButtonTapped()
}

class SearchContainerView: UIView {

    // MARK: PROPERTIES -
    
    var searchTextFieldLeadingAnchor: NSLayoutConstraint?
    var delegate: SearchContainerViewActionDelegate?
    
    let searchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -4)
        view.layer.shadowRadius = 10
        
        return view
    }()
    
    let searchTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(
            string: Strings.SEARCH_TEXT_PLACEHOLDER,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7),
                NSAttributedString.Key.font: UIFont.customFont(ofType: .regular, withSize: 16)
                        ]
        )
        tf.textColor = UIColor.black
        tf.font = .customFont(ofType: .regular, withSize: 16)
        tf.addTarget(self, action: #selector(textFieldDidChanges), for: .editingChanged)
        return tf
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.setImage(UIImage(named: "ic_back2")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = UIColor.gray.withAlphaComponent(0.8)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_close")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = UIColor.gray.withAlphaComponent(0.8)
        button.isHidden = true
        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        return button
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
        addSubview(searchView)
        searchView.addSubview(backButton)
        searchView.addSubview(closeButton)
        searchView.addSubview(searchTextField)
        
        addShadowToSearchView()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            searchView.bottomAnchor.constraint(equalTo: bottomAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 50),
            
            closeButton.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -15 ),
            closeButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 15),
            closeButton.heightAnchor.constraint(equalToConstant: 15),
            
            backButton.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
            backButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            searchTextField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -10)
        ])
        
        searchTextFieldLeadingAnchor = searchTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 15)
        // 45 otherwise
        searchTextFieldLeadingAnchor?.isActive = true
    }
    
    func addShadowToSearchView(){
        searchView.layer.shadowOpacity = 1
    }
    
    func removeShadowFromSearchView(){
        searchView.layer.shadowOpacity = 0
    }
    
    // MARK: - ACTIONS
    
    @objc func textFieldDidChanges(){
        
        if searchTextField.text == "" {
            closeButton.isHidden = true
        } else {
            closeButton.isHidden = false
        }
        delegate?.didSearchTextFieldChanged(with: searchTextField.text ?? "")
        
    }
    
    @objc func closeTapped(){
        delegate?.didCloseTapped()
    }
    
    @objc func backButtonTapped(){
        delegate?.didBackButtonTapped()
    }
}

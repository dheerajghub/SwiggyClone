//
//  SearchedContentTableViewCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/03/22.
//

import UIKit

class SearchedContentTableViewCell: UITableViewCell {

    // MARK: PROPERTIES -
    
    let contentImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .black
        img.layer.cornerRadius = 5
        return img
    }()
    
    let contentInfoLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
    // MARK: MAIN -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        backgroundColor = .white
        addSubview(contentImageView)
        addSubview(contentInfoLabel)
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            contentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            contentImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentImageView.widthAnchor.constraint(equalToConstant: 65),
            contentImageView.heightAnchor.constraint(equalToConstant: 65),
            
            contentInfoLabel.leadingAnchor.constraint(equalTo: contentImageView.trailingAnchor, constant: 15),
            contentInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            contentInfoLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    public func setAttributedTitle(title: String , subtitle: String, searchFor: String?) {
        contentInfoLabel.setAttributedTitleAndSubtitle(title: title, withFont: .customFont(ofType: .regular, withSize: 15), withColor: .black.withAlphaComponent(0.8), subtitle: subtitle , withFont: .customFont(ofType: .regular, withSize: 14), withColor: .gray.withAlphaComponent(0.7), searchString: searchFor, highlightedFont: .customFont(ofType: .bold, withSize: 15))
    }

}

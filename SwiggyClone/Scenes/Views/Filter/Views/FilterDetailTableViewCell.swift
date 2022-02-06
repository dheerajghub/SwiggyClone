//
//  FilterDetailTableViewCell.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/02/22.
//

import UIKit

class FilterDetailTableViewCell: UITableViewCell {

    // MARK: PROPERTIES -
    var isMultiple: Bool = false {
        didSet {
            markImage.image = isMultiple ? UIImage(named: "ic_uncheckbox")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "ic_uncheck")?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    var data: FilterOptions? {
        didSet {
            guard let data = data else { return }
            detailLabel.text = data.title
            markImage.image = data.isSelected ? UIImage(named: "ic_check")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "ic_uncheck")?.withRenderingMode(.alwaysTemplate)
            markImage.tintColor = data.isSelected ? Colors.appOrange : .black.withAlphaComponent(0.2)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if !isMultiple {
                markImage.image = isSelected ? UIImage(named: "ic_check")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "ic_uncheck")?.withRenderingMode(.alwaysTemplate)
            } else {
                markImage.image = isSelected ? UIImage(named: "ic_checkbox")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "ic_uncheckbox")?.withRenderingMode(.alwaysTemplate)
            }
            
            markImage.tintColor = isSelected ? Colors.appOrange : .black.withAlphaComponent(0.2)
            detailLabel.textColor = isSelected ? .black : .black.withAlphaComponent(0.6)
            detailLabel.font = isSelected ? .customFont(ofType: .bold, withSize: 15) : .customFont(ofType: .regular, withSize: 15)
        }
    }
    
    let markImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "ic_uncheckbox")?.withRenderingMode(.alwaysTemplate)
        return img
    }()
    
    let detailLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Relevance"
        l.textColor = .black.withAlphaComponent(0.6)
        l.font = .customFont(ofType: .regular, withSize: 15)
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
        addSubview(markImage)
        addSubview(detailLabel)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            markImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            markImage.widthAnchor.constraint(equalToConstant: 30),
            markImage.heightAnchor.constraint(equalToConstant: 30),
            markImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            detailLabel.leadingAnchor.constraint(equalTo: markImage.trailingAnchor, constant: 15),
            detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            detailLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}

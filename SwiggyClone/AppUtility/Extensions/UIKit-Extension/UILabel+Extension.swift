//
//  UILabel+Extension.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/03/22.
//

import UIKit

extension UILabel {
    func setAttributedTitleAndSubtitle(title: String , withFont titleFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .medium) , withColor titleColor: UIColor = .white, subtitle: String , withFont subtitleFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .regular) , withColor subtitleColor: UIColor = .white , searchString search: String? = nil , highlightedFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)) {
            
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: titleFont , NSAttributedString.Key.foregroundColor: titleColor]))
                attributedText.append(NSAttributedString(string: subtitle, attributes: [NSAttributedString.Key.font: subtitleFont , NSAttributedString.Key.foregroundColor: subtitleColor]))
        
        if search != nil {
            let range = NSString(string: title).range(of: search ?? "", options: .caseInsensitive)
            let highlightColor = UIColor.black
            let highlightedAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.foregroundColor: highlightColor,
                NSAttributedString.Key.font: highlightedFont
            ]
            attributedText.addAttributes(highlightedAttributes, range: range)
            self.attributedText = attributedText
        } else {
            self.attributedText = attributedText
        }
        
    }
    
}

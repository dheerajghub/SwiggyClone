//
//  NSTextAttachment+Extension.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 30/01/22.
//

import UIKit

extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height
        
        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}

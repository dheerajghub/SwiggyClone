//
//  FilterLauncher.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 05/02/22.
//

import Foundation
import UIKit

class FilterLauncher: NSObject {
    
    let blackView = UIView()
    
    lazy var filterView: FilterView = {
        let v = FilterView()
        v.backgroundColor = .white
        v.delegate = self
        return v
    }()
    
    override init() {
        super.init()
    }
    
    func showFilter(){
        
        guard let window = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first else { return }
        
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissFilter)))
        blackView.isUserInteractionEnabled = true
        
        window.addSubview(blackView)
        window.addSubview(filterView)
        
        blackView.frame = window.frame
        blackView.alpha = 0
        
        let height: CGFloat = window.frame.height * 0.8
        let y = window.frame.height - height
        filterView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
            self.blackView.alpha = 1
            self.filterView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: height)
        }
        
    }
    
    @objc func dismissFilter(){
        UIView.animate(withDuration: 0.3) { [self] in
            blackView.alpha = 0
            
            guard let window = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .compactMap({$0 as? UIWindowScene})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first else { return }
            filterView.frame = CGRect(x: 0, y: window.frame.height, width: self.filterView.frame.width, height: self.filterView.frame.height)
        }
    }
    
}

extension FilterLauncher: FilterViewActionDelegate {
    
    func didCloseBtnTapped() {
        dismissFilter()
    }
    
}

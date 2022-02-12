//
//  AppContants.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import Foundation
import UIKit

let headerKind = "Header"
let footerKind = "Footer"
let sectionBackground = "SectionBackground"


struct Colors {
    
    static let appOrange = UIColor.hexStringToUIColor(hex: "#FF6600")
    
}

struct windowConstant {
    
    private static let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    
    static var getTopPadding: CGFloat {
        return window?.safeAreaInsets.top ?? 0
    }
    
    static var getBottomPadding: CGFloat {
        return window?.safeAreaInsets.bottom ?? 0
    }
    
}

struct Key {
    
    struct ReusableIdentifiers {
        
        static let cellId = "cellId"
        static let foodVCHeaderViewId = "FoodVCFilterHeaderView"
        static let sectionHeaderViewId = "SectionHeaderView"
        static let sectionFooterViewId = "SectionFooterView"
        static let sectionHeaderView2Id = "SectionHeaderView_2"
        
        static let foodTopBannerId = "FoodTopBannerCVCell"
        static let foodCategoryId = "FoodCategoryCVCell"
        static let restaurantListId = "RestaurantsListCVCell"
        static let foodSuggestionCardId = "FoodSuggestionCardCVCell"
        static let restaurantVeganId = "RestaurantVeganCVCell"
        
    }
    
}

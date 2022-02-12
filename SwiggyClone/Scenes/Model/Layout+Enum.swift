//
//  Food+Enums.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import UIKit

enum LayoutType {
    case headerLayout
    case foodCategoryLayout
    case foodListLayout
    case suggestionSectionLayout
    case veganSectionLayout
    case foodDetailBannerLayout
    
    func getLayout(withHeader: Bool = true) -> NSCollectionLayoutSection {
        switch self {
        case .headerLayout:
            return AppLayouts.shared.HeaderLayout()
        case .foodCategoryLayout:
            return AppLayouts.shared.FoodCategoryLayout()
        case .foodListLayout:
            return AppLayouts.shared.FoodListLayout(withHeader: withHeader)
        case .suggestionSectionLayout:
            return AppLayouts.shared.SuggestionSectionLayout()
        case .veganSectionLayout:
            return AppLayouts.shared.VeganSectionLayout()
        case .foodDetailBannerLayout:
            return AppLayouts.shared.FoodDetailBannerLayout()
        }
    }
    
}

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
    
    func getLayout(withHeader: Bool = true) -> NSCollectionLayoutSection {
        switch self {
        case .headerLayout:
            return HeaderLayout()
        case .foodCategoryLayout:
            return FoodCategoryLayout()
        case .foodListLayout:
            return FoodListLayout(withHeader: withHeader)
        case .suggestionSectionLayout:
            return SuggestionSectionLayout()
        }
    }
    
}

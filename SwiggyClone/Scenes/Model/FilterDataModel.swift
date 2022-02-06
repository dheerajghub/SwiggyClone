//
//  FilterDataModel.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/02/22.
//

import Foundation

struct FilterDataModel {
    let category: String
    var options: [FilterOptions]
    let isMultiple: Bool
    let ischangesApplied: Bool
}

struct FilterOptions {
    var isSelected: Bool
    let title: String
}


var filterMockData = [
    FilterDataModel(category: "sort", options: [
        FilterOptions(isSelected: false, title: "Relevance"),
        FilterOptions(isSelected: false, title: "Delivery Time"),
        FilterOptions(isSelected: false, title: "Rating"),
        FilterOptions(isSelected: false, title: "Cost: Low to High"),
        FilterOptions(isSelected: false, title: "Cost: High to Low")
    ], isMultiple: false, ischangesApplied: false),
    
    FilterDataModel(category: "cuisines", options: [
        FilterOptions(isSelected: false, title: "afgani"),
        FilterOptions(isSelected: false, title: "american"),
        FilterOptions(isSelected: false, title: "andhra"),
        FilterOptions(isSelected: false, title: "arabian"),
        FilterOptions(isSelected: false, title: "asian"),
        FilterOptions(isSelected: false, title: "bakery"),
        FilterOptions(isSelected: false, title: "bengali"),
        FilterOptions(isSelected: false, title: "beverage"),
        FilterOptions(isSelected: false, title: "briyani"),
        FilterOptions(isSelected: false, title: "british"),
        FilterOptions(isSelected: false, title: "chaat"),
        FilterOptions(isSelected: false, title: "chinese"),
        FilterOptions(isSelected: false, title: "combo"),
        FilterOptions(isSelected: false, title: "continental"),
        FilterOptions(isSelected: false, title: "dessert"),
        FilterOptions(isSelected: false, title: "european"),
        FilterOptions(isSelected: false, title: "fastfood"),
        FilterOptions(isSelected: false, title: "grill"),
        FilterOptions(isSelected: false, title: "healty food"),
        FilterOptions(isSelected: false, title: "home food"),
        FilterOptions(isSelected: false, title: "hyderabadi"),
        FilterOptions(isSelected: false, title: "ice cream"),
        FilterOptions(isSelected: false, title: "indian"),
        FilterOptions(isSelected: false, title: "italian"),
        FilterOptions(isSelected: false, title: "italian-american")
    ], isMultiple: true, ischangesApplied: false),
    
    FilterDataModel(category: "show restaurants with", options: [
        FilterOptions(isSelected: false, title: "pure veg")
    ], isMultiple: true, ischangesApplied: false),
]

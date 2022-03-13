//
//  SearchFilterModel.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 13/03/22.
//

import Foundation

struct SearchFilterModel {
    let filterType: String
}

let searchFilterDummy = [
    SearchFilterModel(filterType: "Sort By"),
    SearchFilterModel(filterType: "Veg"),
    SearchFilterModel(filterType: "Non-veg"),
    SearchFilterModel(filterType: "Less than Rs 100"),
    SearchFilterModel(filterType: "Rs 100-Rs 250"),
    SearchFilterModel(filterType: "Spicy"),
    SearchFilterModel(filterType: "Less than 30mins"),
    SearchFilterModel(filterType: "Rated 4+")
]

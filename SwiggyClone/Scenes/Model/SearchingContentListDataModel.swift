//
//  SearchingContentListDataModel.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/03/22.
//

import Foundation

struct SearchingContentListDataModel {
    let coverImage: String
    let contentString: String
    let searchCategory: String
}

let searchingContentMockData = [
    SearchingContentListDataModel(coverImage: "", contentString: "burgers", searchCategory: "dish"),
    SearchingContentListDataModel(coverImage: "", contentString: "burritos", searchCategory: "dish"),
    SearchingContentListDataModel(coverImage: "", contentString: "butter naan", searchCategory: "dish"),
    SearchingContentListDataModel(coverImage: "", contentString: "burger king", searchCategory: "restaurant"),
    SearchingContentListDataModel(coverImage: "", contentString: "butter roti", searchCategory: "dish"),
    SearchingContentListDataModel(coverImage: "", contentString: "burgers", searchCategory: "crispy veg burger"),
    SearchingContentListDataModel(coverImage: "", contentString: "crispy chicken burger", searchCategory: "dish"),
    SearchingContentListDataModel(coverImage: "", contentString: "butter chicken", searchCategory: "dish"),
]

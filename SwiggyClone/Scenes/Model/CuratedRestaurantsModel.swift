//
//  CuratedRestaurantsModel.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 01/02/22.
//

import Foundation

struct CuratedRestaurantModel {
    let image: String
    let title: String
    let options: Int
}

let curatedRestaurantsMockData = [
    CuratedRestaurantModel(image: "curated_img1", title: "biryani", options: 2),
    CuratedRestaurantModel(image: "curated_img2", title: "burger", options: 4),
    CuratedRestaurantModel(image: "curated_img3", title: "cakes & desserts", options: 12),
    CuratedRestaurantModel(image: "curated_img4", title: "north india", options: 38),
    CuratedRestaurantModel(image: "curated_img5", title: "south india", options: 10),
    CuratedRestaurantModel(image: "curated_img6", title: "sandwich", options: 18),
    CuratedRestaurantModel(image: "curated_img7", title: "indian snacks", options: 20)
]

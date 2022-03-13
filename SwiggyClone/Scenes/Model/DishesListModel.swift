//
//  DishesListModel.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 13/03/22.
//

import Foundation

struct DishesListModel {
    
    let restaurantTitle: String
    let ratings: Float
    let time: String
    let isVeg: Bool
    let isBestSeller: Bool
    let menuTitle: String
    let menuImage: String
    let price: Float
    let desc: String
    
}

let dishedDummyListData = [
    
    DishesListModel(
        restaurantTitle: "By McDonald's",
        ratings: 4.2,
        time: "36 Mins",
        isVeg: true,
        isBestSeller: true,
        menuTitle: "McAloo Tikki Burger + Fries + Beverages",
        menuImage: "ic_dish_img1",
        price: 109,
        desc: "Save upto Rs.78 on meal of your favourite burger with fries."
    ),
    
    DishesListModel(
        restaurantTitle: "By Burger Point (Sector 70)",
        ratings: 3.9,
        time: "33 Mins",
        isVeg: false,
        isBestSeller: false,
        menuTitle: "Maharaja Chicken Burger",
        menuImage: "ic_dish_img2",
        price: 128,
        desc: "A delightful double chicken burger topped with chicken sauce, shredded lettuce and served on a perfectly toasted bun."
    ),
    
    DishesListModel(
        restaurantTitle: "By Burger Engineers",
        ratings: 4.2,
        time: "38 Mins",
        isVeg: false,
        isBestSeller: true,
        menuTitle: "Chicken Burger",
        menuImage: "ic_dish_img3",
        price: 85,
        desc: ""
    ),
    
    DishesListModel(
        restaurantTitle: "By Burger King",
        ratings: 4.3,
        time: "39 Mins",
        isVeg: true,
        isBestSeller: true,
        menuTitle: "Chicken Burger",
        menuImage: "ic_dish_img4",
        price: 55,
        desc: "Our best selling burger with crispy veg patty, fresh onion and out signature sauce."
    ),
    
    DishesListModel(
        restaurantTitle: "By Pizza Inn",
        ratings: 4.0,
        time: "29 Mins",
        isVeg: true,
        isBestSeller: false,
        menuTitle: "Aloo Tikki Burger",
        menuImage: "ic_dish_img5",
        price: 59,
        desc: "Burger with aloo tikki and flavoured with spices like garam masala and cumin."
    ),
    
]

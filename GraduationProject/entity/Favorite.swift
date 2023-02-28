//
//  Favorite.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 23.02.2023.
//

import Foundation

struct FavoriteMeal {
    let mealId: String?
    let key: String?
    let username: String?
    
    var _key: String {
        key ?? "0"
    }
    var _mealId: String {
        mealId ?? "0"
    }
    var _username: String {
        username ?? ""
    }
}

enum FavoriteRestriction {
    case allMeals
    case favoriteMeals
}

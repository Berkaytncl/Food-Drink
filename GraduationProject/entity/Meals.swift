//
//  Meals.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 10.02.2023.
//

import Foundation

struct MealResponse: Codable {
    let meals: [Meal]?
    let success: Int?
    
    enum CodingKeys: String, CodingKey {
        case meals = "yemekler"
        case success
    }
    
    var _meals: [Meal] {
        meals ?? [Meal]()
    }
}

struct Meal: Codable {
    let mealId: String?
    let mealName: String?
    let mealImageName: String?
    let mealPrice: String?
    
    enum CodingKeys: String, CodingKey {
        case mealId = "yemek_id"
        case mealName = "yemek_adi"
        case mealImageName = "yemek_resim_adi"
        case mealPrice = "yemek_fiyat"
    }
    
    var _mealId: String {
        mealId ?? "0"
    }
    var _mealName: String {
        mealName ?? "N/A"
    }
    var _mealImageName: String {
        mealImageName ?? "N/A"
    }
    var _mealPrice: String {
        mealPrice ?? "0"
    }
}

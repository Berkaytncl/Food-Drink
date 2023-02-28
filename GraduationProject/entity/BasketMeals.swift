//
//  BasketMeals.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 10.02.2023.
//

import Foundation

struct BasketMealResponse: Codable {
    let basketMeals: [BasketMeal]?
    let success: Int?
    
    enum CodingKeys: String, CodingKey {
        case basketMeals = "sepet_yemekler"
        case success
    }
    
    var _basketMeals: [BasketMeal] {
        basketMeals ?? [BasketMeal]()
    }
}

struct BasketMeal: Codable {
    let basketMealId: String?
    let mealName: String?
    let mealImageName: String?
    let mealPrice: String?
    var mealOrderPiece: String?
    let userName: String?
    
    enum CodingKeys: String, CodingKey {
        case basketMealId = "sepet_yemek_id"
        case mealName = "yemek_adi"
        case mealImageName = "yemek_resim_adi"
        case mealPrice = "yemek_fiyat"
        case mealOrderPiece = "yemek_siparis_adet"
        case userName = "kullanici_adi"
    }
    
    var _basketMealId: String {
        basketMealId ?? "0"
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
    var _mealOrderPiece: String {
        mealOrderPiece ?? "0"
    }
    var _userName: String {
        userName ?? "anonim"
    }
}

struct BasketMealItem {
    var mealName: String
    var mealImageName: String
    var mealPrice: String
    var mealOrderPiece: String
}


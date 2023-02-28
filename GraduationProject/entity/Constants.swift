//
//  Constants.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 9.02.2023.
//

import Foundation

struct Constants {
    
    struct URLs {
        private static let baseURL = "http://kasimadalan.pe.hu/yemekler"
        
        static let bringAllFoodURL = "\(baseURL)/tumYemekleriGetir.php"
        static let bringTheBasketURL = "\(baseURL)/sepettekiYemekleriGetir.php"
        static let addToBasketURL = "\(baseURL)/sepeteYemekEkle.php"
        static let deleteFromBasketURL = "\(baseURL)/sepettenYemekSil.php"
        static func downloadImageURL(image: String) -> String { "\(baseURL)/resimler/\(image)" }
    }
    
    struct Colors {
        static let backgroundColor = "backgroundColor"
    }
    
    struct Destination {
        static let toLoginScreenFromOnboard = "toLoginScreenFromOnboard"
        static let toHomeScreen = "toHomeScreen"
        static let toLoginScreen = "toLoginScreen"
        static let toMealDetailScreen = "toMealDetailScreen"
        static let toSortScreen = "toSortScreen"
    }
    
    struct CellReuseID {
        static let onboardingCell = "OnboardingCell"
        static let mealCell = "MealCell"
        static let orderCell = "OrderCell"
        static let sortCell = "SortCell"
        static let accountDetailCell = "AccountDetailCell"
        static let orderItemCell = "OrderItemCell"
    }
    
    struct ImageName {
        static let heartFill = "heart.fill"
        static let heart = "heart"
    }
    
    struct Message {
        static let ordered = "Soon your order will start preparing."
        static let orderPreparing = "Your order has started to be prepared, it will be delivered soon."
        static let orderComing = "Your order will be delivered to your address soon on the way."
        static let orderDelivered = "Your order has been delivered."
    }
    
    struct Sort {
        static let defaultSorting = "Default Sorting"
        static let ascendingAlphabetically = "Ascending Alphabetically Sorting"
        static let descendingAlphabetically = "Descending Alphabetically Sorting"
        static let increasingByPrice = "Increasing By Price Sorting"
        static let decreasingByPrice = "Decreasing By Price Sorting"
    }
    
    static let ok = "OK"
    static let error = "Error"
    static let enterValidMailOrPassword = "Please enter valid email or password!"
    static let couldNotLogOut = "Could not log out"
}

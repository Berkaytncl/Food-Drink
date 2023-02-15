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
        static let toHomeScreen = "toHomeScreen"
        static let toWatchDeliveryScreen = "toWatchDeliveryScreen"
        static let toLoginScreen = "toLoginScreen"
    }
    
    struct CellReuseID {
        static let mealCell = "MealCell"
    }
    
    static let ok = "OK"
    static let error = "Error"
    static let enterValidMailOrPassword = "Please enter valid email or password!"
    static let couldNotLogOut = "Could not log out"
}

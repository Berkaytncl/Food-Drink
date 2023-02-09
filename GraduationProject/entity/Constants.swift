//
//  Constants.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 9.02.2023.
//

import Foundation

enum Constants {
    private static let baseURL = "http://kasimadalan.pe.hu/yemekler"
    
    static let bringAllFood = "\(baseURL)/tumYemekleriGetir.php"
    static let bringTheBasket = "\(baseURL)/sepettekiYemekleriGetir.php"
    static let addToBasket = "\(baseURL)/sepeteYemekEkle.php"
    static let deleteFromBasket = "\(baseURL)/sepettenYemekSil.php"
    static func image(imageName: String) -> String {
        "\(baseURL)/resimler/\(imageName)"
    }
    
    static let ok = "OK"
    static let error = "Error"
    static let enterValidMailOrPassword = "Please enter valid email or password!"
    static let couldNotLogOut = "Could not log out"
}

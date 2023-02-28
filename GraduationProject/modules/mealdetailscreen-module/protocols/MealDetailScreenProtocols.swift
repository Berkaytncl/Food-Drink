//
//  MealDetailScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterMealDetailScreenProtocol {
    var mealDetailScreenInteractor: PresenterToInteractorMealDetailScreenProtocol? { get set }
    var mealDetailScreenView: PresenterToViewMealDetailScreenProtocol? { get set }
    
    func addBasket(meal: Meal, piece: Int)
    func addFavorite(mealId: String)
    func deleteFavorite(key: String)
}

protocol PresenterToInteractorMealDetailScreenProtocol {
    var mealDetailScreenPresenter: InteractorToPresenterMealDetailScreenProtocol? { get set }
    
    func addBasket(meal: Meal, piece: Int)
    func addFavorite(mealId: String)
    func deleteFavorite(key: String)
}

//Router Protocol
protocol PresenterToRouterMealDetailScreenProtocol {
    static func createModule(ref: MealDetailScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterMealDetailScreenProtocol {
    func successfulTransactionInformationToPresenter(mealName: String, piece: Int)
}

protocol PresenterToViewMealDetailScreenProtocol {
    func successfulTransactionInformationToView(mealName: String, piece: Int)
}

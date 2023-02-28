//
//  OrderScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterOrderScreenProtocol {
    var orderScreenInteractor: PresenterToInteractorOrderScreenProtocol? { get set }
    var orderScreenView: PresenterToViewOrderScreenProtocol? { get set }
    
    func uploadBasketMeals()
    func deleteMealFromBasket(basketMealId: [String])
    func placeOrder(basketMeals: [BasketMeal])
}

protocol PresenterToInteractorOrderScreenProtocol {
    var orderScreenPresenter: InteractorToPresenterOrderScreenProtocol? { get set }
    
    func uploadBasketMeals()
    func deleteMealFromBasket(basketMealId: [String])
    func placeOrder(basketMeals: [BasketMeal])
}

//Router Protocol
protocol PresenterToRouterOrderScreenProtocol {
    static func createModule(ref: OrderScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterOrderScreenProtocol {
    func dataSendToPresenter(basketMeals: [BasketMeal], modifiedBasketMeals: [BasketMealItem])
}

protocol PresenterToViewOrderScreenProtocol {
    func dataSendToView(basketMeals: [BasketMeal], modifiedBasketMeals: [BasketMealItem])
}

//Cell Protocol
protocol OrderCellProtocol {
    func deleteBasketPressed(indexPath: IndexPath)
}

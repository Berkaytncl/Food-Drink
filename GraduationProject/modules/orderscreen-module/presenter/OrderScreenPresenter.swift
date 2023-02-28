//
//  OrderScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class OrderScreenPresenter: ViewToPresenterOrderScreenProtocol {
    
    var orderScreenInteractor: PresenterToInteractorOrderScreenProtocol?
    var orderScreenView: PresenterToViewOrderScreenProtocol?
    
    func uploadBasketMeals() {
        orderScreenInteractor?.uploadBasketMeals()
    }

    func deleteMealFromBasket(basketMealId: [String]) {
        orderScreenInteractor?.deleteMealFromBasket(basketMealId: basketMealId)
    }
    
    func placeOrder(basketMeals: [BasketMeal]) {
        orderScreenInteractor?.placeOrder(basketMeals: basketMeals)
    }
}

extension OrderScreenPresenter: InteractorToPresenterOrderScreenProtocol {
    func dataSendToPresenter(basketMeals: [BasketMeal], modifiedBasketMeals: [BasketMealItem]) {
        orderScreenView?.dataSendToView(basketMeals: basketMeals, modifiedBasketMeals: modifiedBasketMeals)
    }
}

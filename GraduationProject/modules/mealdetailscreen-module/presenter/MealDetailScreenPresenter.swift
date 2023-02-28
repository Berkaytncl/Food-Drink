//
//  MealDetailScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class MealDetailScreenPresenter: ViewToPresenterMealDetailScreenProtocol {
    
    var mealDetailScreenInteractor: PresenterToInteractorMealDetailScreenProtocol?
    var mealDetailScreenView: PresenterToViewMealDetailScreenProtocol?
    
    func addBasket(meal: Meal, piece: Int) {
        mealDetailScreenInteractor?.addBasket(meal: meal, piece: piece)
    }
    
    func addFavorite(mealId: String) {
        mealDetailScreenInteractor?.addFavorite(mealId: mealId)
    }
    
    func deleteFavorite(key: String) {
        mealDetailScreenInteractor?.deleteFavorite(key: key)
    }
}

extension MealDetailScreenPresenter: InteractorToPresenterMealDetailScreenProtocol {
    func successfulTransactionInformationToPresenter(mealName: String, piece: Int) {
        mealDetailScreenView?.successfulTransactionInformationToView(mealName: mealName, piece: piece)
    }
}

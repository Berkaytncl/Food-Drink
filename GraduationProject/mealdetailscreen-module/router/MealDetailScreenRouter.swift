//
//  MealDetailScreenRouter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class MealDetailScreenRouter: PresenterToRouterMealDetailScreenProtocol {
    static func createModule(ref: MealDetailScreen) {
        let presenter = MealDetailScreenPresenter()
        
        //View
        ref.mealDetailScreenPresenterObject = presenter
        
        //Presenter
        ref.mealDetailScreenPresenterObject?.mealDetailScreenInteractor = MealDetailScreenInteractor()
//        ref.mealDetailScreenPresenterObject?.mealDetailScreenView = ref
//        
//        //Interactor
//        ref.mealDetailScreenPresenterObject?.mealDetailScreenInteractor?.mealDetailScreenPresenter = presenter
    }
}

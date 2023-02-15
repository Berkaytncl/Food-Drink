//
//  HomeScreenInteractor.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class HomeScreenInteractor: PresenterToInteractorHomeScreenProtocol {
    
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol?
    
    func uploadMeals() {
        NetworkManager.shared.APICall(type: ItemType.bringAllFoodURL) { [weak self] (_ responseModel: MealResponse) in
            guard let self = self else { return }
            self.homeScreenPresenter?.dataSendToPresenter(meals: responseModel._meals)
        }
    }
}

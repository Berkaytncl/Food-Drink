//
//  FavoriteDetailScreenRouter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class FavoriteFoodScreenRouter: PresenterToRouterFavoriteFoodScreenProtocol {
    static func createModule(ref: FavoriteFoodScreen) {
        let presenter = FavoriteFoodScreenPresenter()
        
        //View
        ref.favoriteFoodScreenPresenterObject = presenter
        
        //Presenter
        ref.favoriteFoodScreenPresenterObject?.favoriteFoodScreenInteractor = FavoriteFoodScreenInteractor()
//        ref.favoriteFoodScreenPresenterObject?.favoriteFoodScreenView = ref
//        
//        //Interactor
//        ref.favoriteFoodScreenPresenterObject?.favoriteFoodScreenInteractor?.favoriteFoodScreenPresenter = presenter
    }
}

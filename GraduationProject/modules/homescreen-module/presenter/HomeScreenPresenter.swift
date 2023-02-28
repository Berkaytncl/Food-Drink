//
//  HomeScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class HomeScreenPresenter: ViewToPresenterHomeScreenProtocol {
    
    var homeScreenInteractor: PresenterToInteractorHomeScreenProtocol?
    var homeScreenView: PresenterToViewHomeScreenProtocol?
    
    func getFavoriteMeals() {
        homeScreenInteractor?.getFavoriteMeals()
    }
    
    func uploadMeals(favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction) {
        homeScreenInteractor?.uploadMeals(favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
    }

    func addBasket(meal: Meal) {
        homeScreenInteractor?.addBasket(meal: meal)
    }
    
    func search(searchText: String, favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction) {
        homeScreenInteractor?.search(searchText: searchText, favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
    }
    
    func mealsRestrictionOrSortChanged(meals: [Meal], favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction) {
        homeScreenInteractor?.mealsRestrictionOrSortChanged(meals: meals, favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
    }
    
    func addFavorite(mealId: String) {
        homeScreenInteractor?.addFavorite(mealId: mealId)
    }
    
    func deleteFavorite(key: String) {
        homeScreenInteractor?.deleteFavorite(key: key)
    }
}

extension HomeScreenPresenter: InteractorToPresenterHomeScreenProtocol {
    
    func dataSendToPresenter(meals: [Meal]) {
        homeScreenView?.dataSendToView(meals: meals)
    }

    func dataSendToPresenter(favoriteMeals: [FavoriteMeal]) {
        homeScreenView?.dataSendToView(favoriteMeals: favoriteMeals)
    }
    
    func successfulTransactionInformationToPresenter(mealName: String, piece: Int) {
        homeScreenView?.successfulTransactionInformationToView(mealName: mealName, piece: piece)
    }
}

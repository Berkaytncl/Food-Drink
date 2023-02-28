//
//  HomeScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterHomeScreenProtocol {
    var homeScreenInteractor: PresenterToInteractorHomeScreenProtocol? { get set }
    var homeScreenView: PresenterToViewHomeScreenProtocol? { get set }
    
    func getFavoriteMeals()
    func uploadMeals(favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction)
    func addBasket(meal: Meal)
    func search(searchText: String, favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction)
    func mealsRestrictionOrSortChanged(meals: [Meal], favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction)
    func addFavorite(mealId: String)
    func deleteFavorite(key: String)
}

protocol PresenterToInteractorHomeScreenProtocol {
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol? { get set }
    
    func getFavoriteMeals()
    func uploadMeals(favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction)
    func addBasket(meal: Meal)
    func search(searchText: String, favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction)
    func mealsRestrictionOrSortChanged(meals: [Meal], favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction)
    func addFavorite(mealId: String)
    func deleteFavorite(key: String)
}

//Router Protocol
protocol PresenterToRouterHomeScreenProtocol {
    static func createModule(ref: HomeScreen)
}

//Carrer Protocols
protocol InteractorToPresenterHomeScreenProtocol {
    func dataSendToPresenter(meals: [Meal])
    func dataSendToPresenter(favoriteMeals: [FavoriteMeal])
    func successfulTransactionInformationToPresenter(mealName: String, piece: Int)
}

protocol PresenterToViewHomeScreenProtocol {
    func dataSendToView(meals: [Meal])
    func dataSendToView(favoriteMeals: [FavoriteMeal])
    func successfulTransactionInformationToView(mealName: String, piece: Int)
}

//Cell Protocol
protocol MealCellProtocol {
    func deleteFavorite(indexPath: IndexPath)
    func addFavorite(indexPath: IndexPath)
    func addBasketPressed(indexPath: IndexPath)
}

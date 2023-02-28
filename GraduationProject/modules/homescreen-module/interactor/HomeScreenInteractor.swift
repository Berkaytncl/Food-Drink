//
//  HomeScreenInteractor.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation
import Firebase

class HomeScreenInteractor: PresenterToInteractorHomeScreenProtocol {    
    
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol?
    
    var refMeals = Database.database().reference().child("favoriteMeals")
    
    func getFavoriteMeals() {
        var favoriteMeals = [FavoriteMeal]()
        refMeals.observe(.value) { [weak self] snapshot in
            guard let user = Auth.auth().currentUser?.email else { return }
            guard let self = self else { return }
            if let value = snapshot.value as? [String:AnyObject] {
                for data in value {
                    if let favoriteMeal = data.value as? NSDictionary {
                        let key = data.key
                        let mealId = favoriteMeal["meal_id"] as? String ?? ""
                        let username = favoriteMeal["username"] as? String ?? ""
                        
                        if !favoriteMeals.contains(where: { $0._mealId == mealId }) && username == user {
                            favoriteMeals.append(FavoriteMeal(mealId: mealId, key: key, username: username))
                        }
                    }
                }
            }
            self.homeScreenPresenter?.dataSendToPresenter(favoriteMeals: favoriteMeals)
        }
    }
    
    func uploadMeals(favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction) {
        NetworkManager.shared.APICall(type: APICallType.bringAllFoodURL) { [weak self] (_ responseModel: MealResponse?) in
            guard let response = responseModel else { return }
            guard let self = self else { return }
            if response.success == 1 {
                let meals = response._meals
                if favoriteRestriction == .favoriteMeals {
                    let favoriteMealList = self.getFavoriteMealList(meals: meals, favoriteMeals: favoriteMeals)
                    let sortedMeals = self.sortMeals(meals: favoriteMealList, sortType: sortType)
                    self.homeScreenPresenter?.dataSendToPresenter(meals: sortedMeals)
                } else {
                    let sortedMeals = self.sortMeals(meals: meals, sortType: sortType)
                    self.homeScreenPresenter?.dataSendToPresenter(meals: sortedMeals)
                }
            }
        }
    }
    
    func search(searchText: String, favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction) {
        var meals = [Meal]()
        NetworkManager.shared.APICall(type: APICallType.bringAllFoodURL) { [weak self] (_ responseModel: MealResponse?) in
            guard let response = responseModel else { return }
            guard let self = self else { return }
            if response.success == 1 {
                response._meals.forEach { meal in
                    if meal._mealName.lowercased().contains(searchText.lowercased()) {
                        meals.append(meal)
                    }
                }
                if favoriteRestriction == .favoriteMeals {
                    let favoriteMealList = self.getFavoriteMealList(meals: meals, favoriteMeals: favoriteMeals)
                    let sortedMeals = self.sortMeals(meals: favoriteMealList, sortType: sortType)
                    self.homeScreenPresenter?.dataSendToPresenter(meals: sortedMeals)
                } else {
                    let sortedMeals = self.sortMeals(meals: meals, sortType: sortType)
                    self.homeScreenPresenter?.dataSendToPresenter(meals: sortedMeals)
                }
            }
        }
    }
    
    func getFavoriteMealList(meals: [Meal], favoriteMeals: [FavoriteMeal]) -> [Meal] {
        var favoriteMealList = [Meal]()
        favoriteMeals.forEach { favoriteMeal in
            let favorite = meals.filter { $0._mealId == favoriteMeal.mealId }
            favoriteMealList.append(contentsOf: favorite)
        }
        return favoriteMealList
    }
    
    func mealsRestrictionOrSortChanged(meals: [Meal], favoriteMeals: [FavoriteMeal], sortType: SortType, favoriteRestriction: FavoriteRestriction) {
        if favoriteRestriction == .favoriteMeals {
            let favoriteMealList = getFavoriteMealList(meals: meals, favoriteMeals: favoriteMeals)
            let sortedMeals = self.sortMeals(meals: favoriteMealList, sortType: sortType)
            homeScreenPresenter?.dataSendToPresenter(meals: sortedMeals)
        } else {
            let sortedMeals = self.sortMeals(meals: meals, sortType: sortType)
            homeScreenPresenter?.dataSendToPresenter(meals: sortedMeals)
        }
    }
    
    func addFavorite(mealId: String) {
        guard let user = Auth.auth().currentUser?.email else { return }
        let addFavorite = ["key":"","meal_id":mealId,"username":user]
        refMeals.childByAutoId().setValue(addFavorite)
    }
    
    func deleteFavorite(key: String) {
        refMeals.child(key).removeValue()
        getFavoriteMeals()
    }
    
    func sortMeals(meals: [Meal], sortType: SortType) -> [Meal] {
        switch sortType {
        case .defaultSorting:
            return meals.sorted { Int($0._mealId) ?? 0 < Int($1._mealId) ?? 0 }
        case .ascendingAlphabetically:
            return meals.sorted { $0._mealName.lowercased() < $1._mealName.lowercased() }
        case .descendingAlphabetically:
            return meals.sorted { $0._mealName.lowercased() > $1._mealName.lowercased() }
        case .increasingByPrice:
            return meals.sorted { Int($0._mealPrice) ?? 0 < Int($1._mealPrice) ?? 0 }
        case .decreasingByPrice:
            return meals.sorted { Int($0._mealPrice) ?? 0 > Int($1._mealPrice) ?? 0 }
        }
    }
    
    func addBasket(meal: Meal) {
        guard let user = Auth.auth().currentUser?.email else { return }
        let params = ["yemek_adi":meal._mealName,
                      "yemek_resim_adi":meal._mealImageName,
                      "yemek_fiyat":Int(meal._mealPrice) ?? 0,
                      "yemek_siparis_adet":1,
                      "kullanici_adi":user] as [String : Any]
        NetworkManager.shared.APICall(type: APICallType.addToBasketURL, parameters: params) { [weak self] (_ responseModel: MessageResponse?) in
            guard let response = responseModel else { return }
            guard let self = self else { return }
            if let success = response.success {
                if success == 1 {
                    self.homeScreenPresenter?.successfulTransactionInformationToPresenter(mealName: meal._mealName, piece: 1)
                }
            }
        }
    }
}

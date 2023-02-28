//
//  MealDetailScreenInteractor.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation
import Firebase

class MealDetailScreenInteractor: PresenterToInteractorMealDetailScreenProtocol {
    
    var mealDetailScreenPresenter: InteractorToPresenterMealDetailScreenProtocol?
    
    var refMeals = Database.database().reference().child("favoriteMeals")
    
    func addBasket(meal: Meal, piece: Int) {
        guard let user = Auth.auth().currentUser?.email else { return }
        let params = ["yemek_adi":meal._mealName,
                      "yemek_resim_adi":meal._mealImageName,
                      "yemek_fiyat":Int(meal._mealPrice) ?? 0,
                      "yemek_siparis_adet":piece,
                      "kullanici_adi":user] as [String : Any]
        NetworkManager.shared.APICall(type: APICallType.addToBasketURL, parameters: params) { [weak self] (_ responseModel: MessageResponse?) in
            guard let response = responseModel else { return }
            guard let self = self else { return }
            if let success = response.success {
                if success == 1 {
                    self.mealDetailScreenPresenter?.successfulTransactionInformationToPresenter(mealName: meal._mealName, piece: piece)
                }
            }
        }
    }
    
    func addFavorite(mealId: String) {
        let addFavorite = ["key":"","meal_id":mealId]
        refMeals.childByAutoId().setValue(addFavorite)
    }
    
    func deleteFavorite(key: String) {
        refMeals.child(key).removeValue()
    }
}

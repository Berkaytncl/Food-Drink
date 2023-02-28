//
//  OrderScreenInteractor.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation
import Firebase

class OrderScreenInteractor: PresenterToInteractorOrderScreenProtocol {
    
    var orderScreenPresenter: InteractorToPresenterOrderScreenProtocol?
    
    var refOrders = Database.database().reference().child("placedOrders")
    
    func uploadBasketMeals() {
        guard let user = Auth.auth().currentUser?.email else { return }
        let params = ["kullanici_adi":user]
        NetworkManager.shared.APICall(type: APICallType.bringTheBasketURL, parameters: params) { [weak self] (_ responseModel: BasketMealResponse?) in
            guard let self = self else { return }
            guard let response = responseModel else {
                self.orderScreenPresenter?.dataSendToPresenter(basketMeals: [BasketMeal](), modifiedBasketMeals: [BasketMealItem]())
                return
            }
            if response.success == 1 {
                var modifiedBasketMeals = [BasketMealItem]()
                
                response._basketMeals.forEach { basketMeal in
                    var isContain = false
                    modifiedBasketMeals.enumerated().forEach { index, modifiedBasketMeal in
                        if modifiedBasketMeal.mealName == basketMeal._mealName {
                            isContain = true
                            let currentPiece = Int(modifiedBasketMeal.mealOrderPiece) ?? 0
                            let addPiece = Int(basketMeal._mealOrderPiece) ?? 0
                            modifiedBasketMeals[index].mealOrderPiece = "\(currentPiece + addPiece)"
                        }
                    }
                    if !isContain {
                        let mealName = basketMeal._mealName
                        let mealImageName = basketMeal._mealImageName
                        let mealPrice = basketMeal._mealPrice
                        let mealOrderPiece = basketMeal._mealOrderPiece
                        modifiedBasketMeals.append(BasketMealItem(mealName: mealName, mealImageName: mealImageName, mealPrice: mealPrice, mealOrderPiece: mealOrderPiece))
                    }
                }
                
                self.orderScreenPresenter?.dataSendToPresenter(basketMeals: response._basketMeals, modifiedBasketMeals: modifiedBasketMeals)
            }
        }
    }
    
    func deleteMealFromBasket(basketMealId: [String]) {
        guard let user = Auth.auth().currentUser?.email else { return }
        var params: [String : Any] = ["kullanici_adi":user]
        basketMealId.forEach { basketMealId in
            params["sepet_yemek_id"] = Int(basketMealId) ?? 0
            NetworkManager.shared.APICall(type: APICallType.deleteFromBasketURL, parameters: params) { [weak self] (_ responseModel: MealResponse?) in
                guard let response = responseModel else { return }
                guard let self = self else { return }
                if response.success == 1 {
                    self.uploadBasketMeals()
                }
            }
        }
    }
    
    func placeOrder(basketMeals: [BasketMeal]) {
        var modifiedBasketMeals = [BasketMeal]()
        refOrders = refOrders.childByAutoId()
        basketMeals.forEach { basketMeal in
            var isContain = false
            modifiedBasketMeals.enumerated().forEach { index, modifiedBasketMeal in
                if modifiedBasketMeal._mealName == basketMeal._mealName {
                    isContain = true
                    let currentPiece = Int(modifiedBasketMeal._mealOrderPiece) ?? 0
                    let addPiece = Int(basketMeal._mealOrderPiece) ?? 0
                    modifiedBasketMeals[index].mealOrderPiece = "\(currentPiece + addPiece)"
                }
            }
            if !isContain {
                let basketMealId = basketMeal._basketMealId
                let mealName = basketMeal._mealName
                let mealImageName = basketMeal._mealImageName
                let mealPrice = basketMeal._mealPrice
                let mealOrderPiece = basketMeal._mealOrderPiece
                let userName = basketMeal._userName
                modifiedBasketMeals.append(BasketMeal(basketMealId: basketMealId, mealName: mealName, mealImageName: mealImageName, mealPrice: mealPrice, mealOrderPiece: mealOrderPiece, userName: userName))
            }
        }
        var index = 0
        let date = Date()
        let orderDetail = ["order_state":OrderState.allCases[0].rawValue,
                           "order_time":Int(date.timeIntervalSince1970)] as [String : Any]
        refOrders.setValue(orderDetail)
        modifiedBasketMeals.forEach { modifiedBasketMeal in
            let order = ["username":modifiedBasketMeal._userName,
                         "order_id":"",
                         "meal_image_name":modifiedBasketMeal._mealImageName,
                         "meal_name":modifiedBasketMeal._mealName,
                         "meal_price":modifiedBasketMeal._mealPrice,
                         "meal_order_piece":modifiedBasketMeal._mealOrderPiece]
            refOrders.childByAutoId().setValue(order)
            index += 1
        }
        var basketMealId = [String]()
        basketMeals.forEach { basketMeal in
            basketMealId.append(basketMeal._basketMealId)
        }
        deleteMealFromBasket(basketMealId: basketMealId)
        refOrders = Database.database().reference().child("placedOrders")
    }
}

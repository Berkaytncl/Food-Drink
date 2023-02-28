//
//  AccountDetailScreenInteractor.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation
import Firebase

class AccountDetailScreenInteractor: PresenterToInteractorAccountDetailScreenProtocol {
    
    var accountDetailScreenPresenter: InteractorToPresenterAccountDetailScreenProtocol?
    
    var refOrders = Database.database().reference().child("placedOrders")
    
    func getAllOrders() {
        guard let user = Auth.auth().currentUser?.email else { return }
        var username = ""
        var orders = [Order]()
        var orderItems = [OrderItem]()
        refOrders.getData(completion: { [weak self] error, snapshot in
            guard let self = self else { return }
            guard error == nil, let snapshot = snapshot else {
              print(error!.localizedDescription)
              return
            }
            
            if let value = snapshot.value as? [String:AnyObject] {
                for data in value {
                    if let order = data.value as? [String:AnyObject] {
                        let keys = order.keys
                        let unixOrderTime = order["order_time"] as? Int ?? 0
                        let orderStateString = order["order_state"] as? String ?? ""
                        var orderState = OrderState.ordered
                        OrderState.allCases.forEach {
                            if $0.rawValue == orderStateString {
                                orderState = $0
                            }
                        }
                        for key in keys {
                            if let eachOrder = order["\(key)"] as? NSDictionary {
                                let orderId = eachOrder["order_id"] as? String ?? ""
                                let mealName = eachOrder["meal_name"] as? String ?? ""
                                let mealImageName = eachOrder["meal_image_name"] as? String ?? ""
                                let mealPrice = eachOrder["meal_price"] as? String ?? ""
                                let mealOrderPiece = eachOrder["meal_order_piece"] as? String ?? ""
                                username = eachOrder["username"] as? String ?? ""
                                
                                if username == user {
                                    orderItems.append(OrderItem(orderId: orderId, mealName: mealName, mealImageName: mealImageName, mealPrice: mealPrice, mealOrderPiece: mealOrderPiece, userName: username))
                                }
                            }
                        }
                        if username == user {
                            orders.append(Order(orderItems: orderItems, orderState: orderState, unixOrderTime: unixOrderTime, key: data.key))
                        }
                        orderItems.removeAll()
                    }
                }
            }
            orders = orders.sorted { $0.unixOrderTime > $1.unixOrderTime }
            self.accountDetailScreenPresenter?.dataSendToPresenter(orders: orders)
        })
    }
    
    func changeOrderState(orderState: OrderState, key: String, changeStateIndex: Int) {
        if orderState != OrderState.allCases.last {
            var index = 0
            for state in OrderState.allCases {
                index += 1
                if orderState == state {
                    refOrders.child(key).updateChildValues(["order_state" : OrderState.allCases[index].rawValue])
                    accountDetailScreenPresenter?.dataSendToPresenter(changedOrderState: OrderState.allCases[index], changedStateIndex: changeStateIndex)
                }
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            accountDetailScreenPresenter?.dataSendToPresenter(error: nil)
        } catch {
            accountDetailScreenPresenter?.dataSendToPresenter(error: error)
        }
    }
}

//
//  Order.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 26.02.2023.
//

import Foundation

struct Order {
    let orderItems: [OrderItem]
    var orderState: OrderState
    let unixOrderTime: Int
    let key: String
}

struct OrderItem {
    let orderId: String?
    let mealName: String?
    let mealImageName: String?
    let mealPrice: String?
    let mealOrderPiece: String?
    let userName: String?
    
    var _orderId: String {
        orderId ?? "0"
    }
    var _mealName: String {
        mealName ?? "N/A"
    }
    var _mealImageName: String {
        mealImageName ?? "N/A"
    }
    var _mealPrice: String {
        mealPrice ?? "0"
    }
    var _mealOrderPiece: String {
        mealOrderPiece ?? "0"
    }
    var _userName: String {
        userName ?? "anonim"
    }
}

enum OrderState: String, CaseIterable {
    case ordered = "Ordered"
    case orderPreparing = "Order preparing"
    case orderComing = "Order coming"
    case orderDelivered = "Order delivered"
}

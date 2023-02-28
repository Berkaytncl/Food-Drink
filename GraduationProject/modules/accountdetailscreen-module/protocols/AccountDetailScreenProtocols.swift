//
//  AccountDetailScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterAccountDetailScreenProtocol {
    var accountDetailScreenInteractor: PresenterToInteractorAccountDetailScreenProtocol? { get set }
    var accountDetailScreenView: PresenterToViewAccountDetailScreenProtocol? { get set }
    
    func getAllOrders()
    func changeOrderState(orderState: OrderState, key: String, changeStateIndex: Int)
    func logout()
}

protocol PresenterToInteractorAccountDetailScreenProtocol {
    var accountDetailScreenPresenter: InteractorToPresenterAccountDetailScreenProtocol? { get set }
    
    func getAllOrders()
    func changeOrderState(orderState: OrderState, key: String, changeStateIndex: Int)
    func logout()
}

//Router Protocol
protocol PresenterToRouterAccountDetailScreenProtocol {
    static func createModule(ref: AccountDetailScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterAccountDetailScreenProtocol {
    func dataSendToPresenter(orders: [Order])
    func dataSendToPresenter(changedOrderState: OrderState, changedStateIndex: Int)
    func dataSendToPresenter(error: Error?)
}

protocol PresenterToViewAccountDetailScreenProtocol {
    func dataSendToView(orders: [Order])
    func dataSendToView(changedOrderState: OrderState, changedStateIndex: Int)
    func dataSendToView(error: Error?)
}

//Cell Protocol
protocol AccountDetailCellProtocol {
    func changeOrderState(indexPath: IndexPath)
}


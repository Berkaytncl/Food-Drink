//
//  AccountDetailScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class AccountDetailScreenPresenter: ViewToPresenterAccountDetailScreenProtocol {    
    
    var accountDetailScreenInteractor: PresenterToInteractorAccountDetailScreenProtocol?
    var accountDetailScreenView: PresenterToViewAccountDetailScreenProtocol?
    
    func getAllOrders() {
        accountDetailScreenInteractor?.getAllOrders()
    }
    
    func changeOrderState(orderState: OrderState, key: String, changeStateIndex: Int) {
        accountDetailScreenInteractor?.changeOrderState(orderState: orderState, key: key, changeStateIndex: changeStateIndex)
    }
    
    func logout() {
        accountDetailScreenInteractor?.logout()
    }
}

extension AccountDetailScreenPresenter: InteractorToPresenterAccountDetailScreenProtocol {
    func dataSendToPresenter(orders: [Order]) {
        accountDetailScreenView?.dataSendToView(orders: orders)
    }
    
    func dataSendToPresenter(changedOrderState: OrderState, changedStateIndex: Int) {
        accountDetailScreenView?.dataSendToView(changedOrderState: changedOrderState, changedStateIndex: changedStateIndex)
    }
    
    func dataSendToPresenter(error: Error?) {
        accountDetailScreenView?.dataSendToView(error: error)
    }
}

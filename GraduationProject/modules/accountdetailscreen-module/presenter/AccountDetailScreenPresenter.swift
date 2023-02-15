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
    
    func logout() {
        accountDetailScreenInteractor?.logout()
    }
}

extension AccountDetailScreenPresenter: InteractorToPresenterAccountDetailScreenProtocol {
    func dataSendToPresenter(error: Error?) {
        accountDetailScreenView?.dataSendToView(error: error)
    }
}

//
//  AccountDetailScreenRouter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class AccountDetailScreenRouter: PresenterToRouterAccountDetailScreenProtocol {
    static func createModule(ref: AccountDetailScreen) {
        let presenter = AccountDetailScreenPresenter()
        
        //View
        ref.accountDetailScreenPresenterObject = presenter
        
        //Presenter
        ref.accountDetailScreenPresenterObject?.accountDetailScreenInteractor = AccountDetailScreenInteractor()
        ref.accountDetailScreenPresenterObject?.accountDetailScreenView = ref
        
        //Interactor
        ref.accountDetailScreenPresenterObject?.accountDetailScreenInteractor?.accountDetailScreenPresenter = presenter
    }
}

//
//  LoginScreenRouter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class LoginScreenRouter: PresenterToRouterLoginScreenProtocol {
    static func createModule(ref: LoginScreen) {
        let presenter = LoginScreenPresenter()
        
        //View
        ref.loginScreenPresenterObject = presenter
        
        //Presenter
        ref.loginScreenPresenterObject?.loginScreenInteractor = LoginScreenInteractor()
        ref.loginScreenPresenterObject?.loginScreenView = ref

        //Interactor
        ref.loginScreenPresenterObject?.loginScreenInteractor?.loginScreenPresenter = presenter
    }
}

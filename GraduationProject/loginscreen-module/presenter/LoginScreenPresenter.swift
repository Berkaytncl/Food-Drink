//
//  LoginScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class LoginScreenPresenter: ViewToPresenterLoginScreenProtocol {
    
    var loginScreenInteractor: PresenterToInteractorLoginScreenProtocol?
    var loginScreenView: PresenterToViewLoginScreenProtocol?
    
    func login(email: String?, password: String?) {
        loginScreenInteractor?.login(email: email, password: password)
    }

    func signup(email: String?, password: String?) {
        loginScreenInteractor?.signup(email: email, password: password)
    }
}

extension LoginScreenPresenter: InteractorToPresenterLoginScreenProtocol {
    func dataSendToPresenter(loginSuccess: Bool, error: Error?) {
        loginScreenView?.dataSendToView(loginSuccess: loginSuccess, error: error)
    }
}

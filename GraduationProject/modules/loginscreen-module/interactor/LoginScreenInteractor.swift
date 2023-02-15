//
//  LoginScreenInteractor.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation
import Firebase

class LoginScreenInteractor: PresenterToInteractorLoginScreenProtocol {
    
    var loginScreenPresenter: InteractorToPresenterLoginScreenProtocol?
    
    func login(email: String?, password: String?) {
        if !email.isNilOrEmpty && !password.isNilOrEmpty {
            Auth.auth().signIn(withEmail: email!, password: password!) { [weak self] authDataResult, error in
                guard let strongSelf = self else { return }
                if error != nil {
                    strongSelf.loginScreenPresenter?.dataSendToPresenter(loginSuccess: false, error: error)
                } else {
                    strongSelf.loginScreenPresenter?.dataSendToPresenter(loginSuccess: true, error: nil)
                }
            }
        } else {
            self.loginScreenPresenter?.dataSendToPresenter(loginSuccess: false, error: nil)
        }
    }
    
    func signup(email: String?, password: String?) {
        if !email.isNilOrEmpty && !password.isNilOrEmpty {
            Auth.auth().createUser(withEmail: email!, password: password!) { authDataResult, error in
                if error != nil {
                    self.loginScreenPresenter?.dataSendToPresenter(loginSuccess: false, error: error)
                } else {
                    self.loginScreenPresenter?.dataSendToPresenter(loginSuccess: true, error: nil)
                }
            }
        } else {
            self.loginScreenPresenter?.dataSendToPresenter(loginSuccess: false, error: nil)
        }
    }
}

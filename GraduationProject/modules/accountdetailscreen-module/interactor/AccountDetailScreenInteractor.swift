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
    
    func logout() {
        do {
            try Auth.auth().signOut()
            accountDetailScreenPresenter?.dataSendToPresenter(error: nil)
        } catch {
            accountDetailScreenPresenter?.dataSendToPresenter(error: error)
        }
    }
}

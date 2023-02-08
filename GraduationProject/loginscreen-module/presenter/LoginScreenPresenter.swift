//
//  LoginScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class LoginScreenPresenter: ViewToPresenterLoginScreenProtocol {
    
    var loginScreenInteractor: PresenterToInteractorLoginScreenProtocol?
    //var loginScreenView: PresenterToViewLoginScreenProtocol?
    
//    func uploadTodos() {
//        homeScreenInteractor?.uploadTodos()
//    }
//
//    func search(searchWord: String) {
//        homeScreenInteractor?.search(searchWord: searchWord)
//    }
//
//    func delete(todoId: Int) {
//        homeScreenInteractor?.delete(todoId: todoId)
//    }
}

extension LoginScreenPresenter: InteractorToPresenterLoginScreenProtocol {
//    func dataSendToPresenter(todoList: [ToDos]) {
//        homeScreenView?.dataSendToView(todoList: todoList)
//    }
}

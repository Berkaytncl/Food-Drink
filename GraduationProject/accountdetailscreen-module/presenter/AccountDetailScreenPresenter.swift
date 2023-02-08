//
//  AccountDetailScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class AccountDetailScreenPresenter: ViewToPresenterAccountDetailScreenProtocol {
    
    var accountDetailScreenInteractor: PresenterToInteractorAccountDetailScreenProtocol?
    //var accountDetailScreenView: PresenterToViewAccountDetailScreenProtocol?
    
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

extension AccountDetailScreenPresenter: InteractorToPresenterAccountDetailScreenProtocol {
//    func dataSendToPresenter(todoList: [ToDos]) {
//        homeScreenView?.dataSendToView(todoList: todoList)
//    }
}

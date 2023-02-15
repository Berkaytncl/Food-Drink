//
//  OrderScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class OrderScreenPresenter: ViewToPresenterOrderScreenProtocol {
    
    var orderScreenInteractor: PresenterToInteractorOrderScreenProtocol?
    //var orderScreenView: PresenterToViewOrderScreenProtocol?
    
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

extension OrderScreenPresenter: InteractorToPresenterOrderScreenProtocol {
//    func dataSendToPresenter(todoList: [ToDos]) {
//        homeScreenView?.dataSendToView(todoList: todoList)
//    }
}

//
//  HomeScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class HomeScreenPresenter: ViewToPresenterHomeScreenProtocol {
    
    var homeScreenInteractor: PresenterToInteractorHomeScreenProtocol?
    //var homeScreenView: PresenterToViewHomeScreenProtocol?
    
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

extension HomeScreenPresenter: InteractorToPresenterHomeScreenProtocol {
//    func dataSendToPresenter(todoList: [ToDos]) {
//        homeScreenView?.dataSendToView(todoList: todoList)
//    }
}

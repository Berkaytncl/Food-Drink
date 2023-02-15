//
//  FavoriteFoodScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class FavoriteFoodScreenPresenter: ViewToPresenterFavoriteFoodScreenProtocol {
    
    var favoriteFoodScreenInteractor: PresenterToInteractorFavoriteFoodScreenProtocol?
    //var favoriteFoodScreenView: PresenterToViewFavoriteFoodScreenProtocol?
    
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

extension FavoriteFoodScreenPresenter: InteractorToPresenterFavoriteFoodScreenProtocol {
//    func dataSendToPresenter(todoList: [ToDos]) {
//        homeScreenView?.dataSendToView(todoList: todoList)
//    }
}

//
//  WatchDeliveryScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class WatchDeliveryScreenPresenter: ViewToPresenterWatchDeliveryScreenProtocol {
    
    var watchDeliveryScreenInteractor: PresenterToInteractorWatchDeliveryScreenProtocol?
    //var watchDeliveryScreenView: PresenterToViewWatchDeliveryScreenProtocol?
    
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

extension WatchDeliveryScreenPresenter: InteractorToPresenterWatchDeliveryScreenProtocol {
//    func dataSendToPresenter(todoList: [ToDos]) {
//        homeScreenView?.dataSendToView(todoList: todoList)
//    }
}

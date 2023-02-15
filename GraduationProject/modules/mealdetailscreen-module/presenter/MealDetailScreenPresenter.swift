//
//  MealDetailScreenPresenter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class MealDetailScreenPresenter: ViewToPresenterMealDetailScreenProtocol {
    
    var mealDetailScreenInteractor: PresenterToInteractorMealDetailScreenProtocol?
    //var mealDetailScreenView: PresenterToViewMealDetailScreenProtocol?
    
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

extension MealDetailScreenPresenter: InteractorToPresenterMealDetailScreenProtocol {
//    func dataSendToPresenter(todoList: [ToDos]) {
//        homeScreenView?.dataSendToView(todoList: todoList)
//    }
}

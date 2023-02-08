//
//  MealDetailScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterMealDetailScreenProtocol {
    var mealDetailScreenInteractor: PresenterToInteractorMealDetailScreenProtocol? { get set }
    //var mealDetailScreenView: PresenterToViewMealDetailScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

protocol PresenterToInteractorMealDetailScreenProtocol {
    //var mealDetailScreenPresenter: InteractorToPresenterMealDetailScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

//Router Protocol
protocol PresenterToRouterMealDetailScreenProtocol {
    static func createModule(ref: MealDetailScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterMealDetailScreenProtocol {
    //func dataSendToPresenter(todoList: [ToDos])
}

protocol PresenterToViewMealDetailScreenProtocol {
    //func dataSendToView(todoList: [ToDos])
}

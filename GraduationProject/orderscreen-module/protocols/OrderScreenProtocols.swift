//
//  OrderScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterOrderScreenProtocol {
    var orderScreenInteractor: PresenterToInteractorOrderScreenProtocol? { get set }
    //var orderScreenView: PresenterToViewOrderScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

protocol PresenterToInteractorOrderScreenProtocol {
    //var orderScreenPresenter: InteractorToPresenterOrderScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

//Router Protocol
protocol PresenterToRouterOrderScreenProtocol {
    static func createModule(ref: OrderScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterOrderScreenProtocol {
    //func dataSendToPresenter(todoList: [ToDos])
}

protocol PresenterToViewOrderScreenProtocol {
    //func dataSendToView(todoList: [ToDos])
}

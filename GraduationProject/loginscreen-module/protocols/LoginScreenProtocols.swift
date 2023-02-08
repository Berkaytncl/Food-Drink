//
//  LoginScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterLoginScreenProtocol {
    var loginScreenInteractor: PresenterToInteractorLoginScreenProtocol? { get set }
    //var loginScreenView: PresenterToViewLoginScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

protocol PresenterToInteractorLoginScreenProtocol {
    //var loginScreenPresenter: InteractorToPresenterLoginScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

//Router Protocol
protocol PresenterToRouterLoginScreenProtocol {
    static func createModule(ref: LoginScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterLoginScreenProtocol {
    //func dataSendToPresenter(todoList: [ToDos])
}

protocol PresenterToViewLoginScreenProtocol {
    //func dataSendToView(todoList: [ToDos])
}

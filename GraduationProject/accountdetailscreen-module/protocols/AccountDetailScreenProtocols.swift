//
//  AccountDetailScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterAccountDetailScreenProtocol {
    var accountDetailScreenInteractor: PresenterToInteractorAccountDetailScreenProtocol? { get set }
    //var accountDetailScreenView: PresenterToViewAccountDetailScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

protocol PresenterToInteractorAccountDetailScreenProtocol {
    //var accountDetailScreenPresenter: InteractorToPresenterAccountDetailScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

//Router Protocol
protocol PresenterToRouterAccountDetailScreenProtocol {
    static func createModule(ref: AccountDetailScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterAccountDetailScreenProtocol {
    //func dataSendToPresenter(todoList: [ToDos])
}

protocol PresenterToViewAccountDetailScreenProtocol {
    //func dataSendToView(todoList: [ToDos])
}

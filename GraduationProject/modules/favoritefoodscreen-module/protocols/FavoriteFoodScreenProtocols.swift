//
//  FavoriteFoodScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterFavoriteFoodScreenProtocol {
    var favoriteFoodScreenInteractor: PresenterToInteractorFavoriteFoodScreenProtocol? { get set }
    //var favoriteFoodScreenView: PresenterToViewFavoriteFoodScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

protocol PresenterToInteractorFavoriteFoodScreenProtocol {
    //var favoriteFoodScreenPresenter: InteractorToPresenterFavoriteFoodScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

//Router Protocol
protocol PresenterToRouterFavoriteFoodScreenProtocol {
    static func createModule(ref: FavoriteFoodScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterFavoriteFoodScreenProtocol {
    //func dataSendToPresenter(todoList: [ToDos])
}

protocol PresenterToViewFavoriteFoodScreenProtocol {
    //func dataSendToView(todoList: [ToDos])
}

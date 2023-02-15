//
//  WatchDeliveryScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterWatchDeliveryScreenProtocol {
    var watchDeliveryScreenInteractor: PresenterToInteractorWatchDeliveryScreenProtocol? { get set }
    //var watchDeliveryScreenView: PresenterToViewWatchDeliveryScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

protocol PresenterToInteractorWatchDeliveryScreenProtocol {
    //var watchDeliveryScreenPresenter: InteractorToPresenterWatchDeliveryScreenProtocol? { get set }
    
    //func uploadTodos()
    //func search(searchWord: String)
    //func delete(todoId: Int)
}

//Router Protocol
protocol PresenterToRouterWatchDeliveryScreenProtocol {
    static func createModule(ref: WatchDeliveryScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterWatchDeliveryScreenProtocol {
    //func dataSendToPresenter(todoList: [ToDos])
}

protocol PresenterToViewWatchDeliveryScreenProtocol {
    //func dataSendToView(todoList: [ToDos])
}

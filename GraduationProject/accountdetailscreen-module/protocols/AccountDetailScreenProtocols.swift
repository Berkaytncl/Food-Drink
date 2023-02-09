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
    var accountDetailScreenView: PresenterToViewAccountDetailScreenProtocol? { get set }
    
    func logout()
}

protocol PresenterToInteractorAccountDetailScreenProtocol {
    var accountDetailScreenPresenter: InteractorToPresenterAccountDetailScreenProtocol? { get set }
    
    func logout()
}

//Router Protocol
protocol PresenterToRouterAccountDetailScreenProtocol {
    static func createModule(ref: AccountDetailScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterAccountDetailScreenProtocol {
    func dataSendToPresenter(error: Error?)
}

protocol PresenterToViewAccountDetailScreenProtocol {
    func dataSendToView(error: Error?)
}

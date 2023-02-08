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
    var loginScreenView: PresenterToViewLoginScreenProtocol? { get set }
    
    func login(email: String?, password: String?)
    func signup(email: String?, password: String?)
}

protocol PresenterToInteractorLoginScreenProtocol {
    var loginScreenPresenter: InteractorToPresenterLoginScreenProtocol? { get set }
    
    func login(email: String?, password: String?)
    func signup(email: String?, password: String?)
}

//Router Protocol
protocol PresenterToRouterLoginScreenProtocol {
    static func createModule(ref: LoginScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterLoginScreenProtocol {
    func dataSendToPresenter(loginSuccess: Bool, error: Error?)
}

protocol PresenterToViewLoginScreenProtocol {
    func dataSendToView(loginSuccess: Bool, error: Error?)
}

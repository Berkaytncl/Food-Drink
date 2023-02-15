//
//  HomeScreenProtocols.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterHomeScreenProtocol {
    var homeScreenInteractor: PresenterToInteractorHomeScreenProtocol? { get set }
    var homeScreenView: PresenterToViewHomeScreenProtocol? { get set }
    
    func uploadMeals()
}

protocol PresenterToInteractorHomeScreenProtocol {
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol? { get set }
    
    func uploadMeals()
}

//Router Protocol
protocol PresenterToRouterHomeScreenProtocol {
    static func createModule(ref: HomeScreen)
}

//Carrer Protocoller
protocol InteractorToPresenterHomeScreenProtocol {
    func dataSendToPresenter(meals: [Meal])
}

protocol PresenterToViewHomeScreenProtocol {
    func dataSendToView(meals: [Meal])
}

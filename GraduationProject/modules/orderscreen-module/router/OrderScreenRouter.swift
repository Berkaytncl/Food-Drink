//
//  OrderScreenRouter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class OrderScreenRouter: PresenterToRouterOrderScreenProtocol {
    static func createModule(ref: OrderScreen) {
        let presenter = OrderScreenPresenter()
        
        //View
        ref.orderScreenPresenterObject = presenter
        
        //Presenter
        ref.orderScreenPresenterObject?.orderScreenInteractor = OrderScreenInteractor()
        ref.orderScreenPresenterObject?.orderScreenView = ref
        
        //Interactor
        ref.orderScreenPresenterObject?.orderScreenInteractor?.orderScreenPresenter = presenter
    }
}

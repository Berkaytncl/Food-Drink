//
//  WatchDeliveryScreenRouter.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import Foundation

class WatchDeliveryScreenRouter: PresenterToRouterWatchDeliveryScreenProtocol {
    static func createModule(ref: WatchDeliveryScreen) {
        let presenter = WatchDeliveryScreenPresenter()
        
        //View
        ref.watchDeliveryScreenPresenterObject = presenter
        
        //Presenter
        ref.watchDeliveryScreenPresenterObject?.watchDeliveryScreenInteractor =  WatchDeliveryScreenInteractor()
//        ref.watchDeliveryScreenPresenterObject?.watchDeliveryScreenView = ref
//        
//        //Interactor
//        ref.watchDeliveryScreenPresenterObject?.watchDeliveryScreenInteractor?.watchDeliveryScreenPresenter = presenter
    }
}

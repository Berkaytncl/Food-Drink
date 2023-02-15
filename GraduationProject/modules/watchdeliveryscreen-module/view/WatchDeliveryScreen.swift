//
//  WatchDeliveryScreen.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import UIKit

class WatchDeliveryScreen: UIViewController {

    var watchDeliveryScreenPresenterObject: ViewToPresenterWatchDeliveryScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WatchDeliveryScreenRouter.createModule(ref: self)
    }
}

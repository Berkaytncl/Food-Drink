//
//  AccountDetailScreen.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import UIKit

class AccountDetailScreen: UIViewController {

    var accountDetailScreenPresenterObject: ViewToPresenterAccountDetailScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AccountDetailScreenRouter.createModule(ref: self)
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        accountDetailScreenPresenterObject?.logout()
    }
}

extension AccountDetailScreen: PresenterToViewAccountDetailScreenProtocol {
    func dataSendToView(error: Error?) {
        guard error != nil else {
            self.performSegue(withIdentifier: Constants.Destination.toLoginScreen, sender: nil)
            return
        }
        self.errorMessage(titleInput: Constants.error, messageInput: Constants.couldNotLogOut)
    }
}

extension AccountDetailScreen {
    func errorMessage(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: Constants.ok, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

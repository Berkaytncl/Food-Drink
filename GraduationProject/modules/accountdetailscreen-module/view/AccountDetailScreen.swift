//
//  AccountDetailScreen.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import UIKit

class AccountDetailScreen: UIViewController {

    var accountDetailScreenPresenterObject: ViewToPresenterAccountDetailScreenProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    var permissionCheck = false
    
    var orders = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AccountDetailScreenRouter.createModule(ref: self)
        
        configureTableView()
        configureUserNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        accountDetailScreenPresenterObject?.getAllOrders()
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        accountDetailScreenPresenterObject?.logout()
    }
}

extension AccountDetailScreen: PresenterToViewAccountDetailScreenProtocol {
    
    func dataSendToView(orders: [Order]) {
        self.orders.removeAll(keepingCapacity: true)
        self.orders = orders
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func dataSendToView(changedOrderState: OrderState, changedStateIndex: Int) {
        self.orders[changedStateIndex].orderState = changedOrderState
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        let body = bodyMessage(orderState: changedOrderState)
        createNotification(title: changedOrderState.rawValue, body: body)
    }
    
    func dataSendToView(error: Error?) {
        guard error != nil else {
            self.performSegue(withIdentifier: Constants.Destination.toLoginScreen, sender: nil)
            return
        }
        self.errorMessage(titleInput: Constants.error, messageInput: Constants.couldNotLogOut)
    }
}

extension AccountDetailScreen: AccountDetailCellProtocol {
    func changeOrderState(indexPath: IndexPath) {
        let order = orders[indexPath.row]
        let changeOrderState = order.orderState
        let key = order.key
        
        accountDetailScreenPresenterObject?.changeOrderState(orderState: changeOrderState, key: key, changeStateIndex: indexPath.row)
    }
}

extension AccountDetailScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountDetailCell.reuseID, for: indexPath) as? AccountDetailCell else { return UITableViewCell() }
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        cell.collectionView.reloadData()
        
        cell.setCell(order: orders[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AccountDetailCell.heightForRowAt
    }
}

extension AccountDetailScreen {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureUserNotification() {
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            self.permissionCheck = granted
        }
    }
    
    func createNotification(title: String, body: String) {
        if permissionCheck {
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.badge = 1
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(notificationRequest)
        }
    }
    
    func bodyMessage(orderState: OrderState) -> String {
        if orderState == .orderPreparing {
            return Constants.Message.orderPreparing
        } else if orderState == .orderComing {
            return Constants.Message.orderComing
        } else {
            return Constants.Message.orderDelivered
        }
    }
    
    func errorMessage(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: Constants.ok, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension AccountDetailScreen: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let app = UIApplication.shared
        app.applicationIconBadgeNumber = 0
        
        completionHandler()
    }
}

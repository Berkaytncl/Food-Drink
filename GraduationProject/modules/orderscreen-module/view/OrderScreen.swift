//
//  OrderScreen.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import UIKit

class OrderScreen: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var placeOrderButtonOutlet: UIButton!
    
    var orderScreenPresenterObject: ViewToPresenterOrderScreenProtocol?
    
    var permissionCheck = false
    
    var basketMeals = [BasketMeal]()
    var modifiedBasketMeals = [BasketMealItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OrderScreenRouter.createModule(ref: self)
        
        configureCollectionView()
        configureUserNotification()
        refreshPlaceOrderButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        orderScreenPresenterObject?.uploadBasketMeals()
    }
    
    @IBAction func placeOrderButton(_ sender: Any) {
        orderScreenPresenterObject?.placeOrder(basketMeals: basketMeals)
        createNotification()
    }
}

extension OrderScreen : PresenterToViewOrderScreenProtocol {
    func dataSendToView(basketMeals: [BasketMeal], modifiedBasketMeals: [BasketMealItem]) {
        self.modifiedBasketMeals.removeAll(keepingCapacity: true)
        
        self.basketMeals = basketMeals
        self.modifiedBasketMeals = modifiedBasketMeals
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        refreshTotalPrice()
        refreshPlaceOrderButton()
    }
}

extension OrderScreen: OrderCellProtocol {
    func deleteBasketPressed(indexPath: IndexPath) {
        var basketMealId: [String] = []
        let selectedMeal = modifiedBasketMeals[indexPath.item].mealName
        basketMeals.forEach { basketMeal in
            if basketMeal._mealName == selectedMeal {
                basketMealId.append(basketMeal._basketMealId)
            }
        }
        orderScreenPresenterObject?.deleteMealFromBasket(basketMealId: basketMealId)
    }
}

extension OrderScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modifiedBasketMeals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderCell.reuseID, for: indexPath) as? OrderCell else { return UICollectionViewCell() }
        
        cell.setCell(modifiedBasketMeal: modifiedBasketMeals[indexPath.item])
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension OrderScreen {
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .clear
        
        let layout = UIHelper.createOrderFlowLayout()
        collectionView.collectionViewLayout = layout
    }
    
    func configureUserNotification() {
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            self.permissionCheck = granted
        }
    }
    
    func createNotification() {
        if permissionCheck {
            let content = UNMutableNotificationContent()
            content.title = OrderState.ordered.rawValue
            content.body = Constants.Message.ordered
            content.badge = 1
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(notificationRequest)
        }
    }
    
    func refreshPlaceOrderButton() {
        if basketMeals.isEmpty {
            placeOrderButtonOutlet.isEnabled = false
        } else {
            placeOrderButtonOutlet.isEnabled = true
        }
    }
    
    func refreshTotalPrice() {
        var totalPrice = 0
        basketMeals.forEach { basketMeal in
            let price = Int(basketMeal._mealPrice) ?? 0
            let piece = Int(basketMeal._mealOrderPiece) ?? 0
            totalPrice += price * piece
        }
        totalLabel.text = "₺\(totalPrice)"
    }
}

extension OrderScreen: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let app = UIApplication.shared
        app.applicationIconBadgeNumber = 0
        
        completionHandler()
    }
}

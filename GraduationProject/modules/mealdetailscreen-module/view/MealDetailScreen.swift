//
//  MealDetailScreen.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import UIKit
import Kingfisher

class MealDetailScreen: UIViewController {

    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealPriceLabel: UILabel!
    @IBOutlet weak var pieceLabel: UILabel!
    @IBOutlet weak var pieceStepper: UIStepper!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var addBasket: UIButton!
    
    var barButton: UIBarButtonItem!
    
    var mealDetailScreenPresenterObject: ViewToPresenterMealDetailScreenProtocol?
    
    var mealDetail: (Meal, Bool, String)?
    var meal: Meal?
    var favorite: Bool?
    var key: String?
    var mealPrice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MealDetailScreenRouter.createModule(ref: self)
                
        if let mealDetail = mealDetail{
            meal = mealDetail.0
            favorite = mealDetail.1
            key = mealDetail.2
        }
        if let meal = meal {
            configureViews(meal: meal)
        }
        if let favorite = favorite {
            configureBarButton(favorite: favorite)
        }
    }
    
    @IBAction func mealPieceStepper(_ sender: Any) {
        if pieceStepper.value == 0 {
            addBasket.isUserInteractionEnabled = false
            addBasket.backgroundColor = .systemGray
        } else {
            addBasket.isUserInteractionEnabled = true
            addBasket.backgroundColor = .systemRed
        }

        pieceLabel.text = "\(Int(pieceStepper.value))"
        totalPriceLabel.text = "₺\(Int(pieceStepper.value) * Int(mealPrice))"
    }
    
    @IBAction func addBasketButton(_ sender: Any) {
        if let meal = meal {
            let piece = Int(pieceStepper.value)
            if piece > 0 {
                mealDetailScreenPresenterObject?.addBasket(meal: meal, piece: piece)
            }
        }
    }
}

extension MealDetailScreen : PresenterToViewMealDetailScreenProtocol {
    func successfulTransactionInformationToView(mealName: String, piece: Int) {
        let alertController = UIAlertController(title: "Food added", message: "\(piece) piece \(mealName) added to basket", preferredStyle: .actionSheet)
        let doneAction = UIAlertAction(title: "Done!", style: .destructive) {_ in
            self.navigationController?.popViewController(animated: true)
        }
        
        alertController.addAction(doneAction)
        
        self.present(alertController, animated: true)
    }
}

extension MealDetailScreen {
    
    func configureBarButton(favorite: Bool) {
        if favorite {
            barButton = UIBarButtonItem(image: UIImage(systemName: Constants.ImageName.heartFill), landscapeImagePhone: nil, style: .done, target: self, action: #selector(favoriteButtonClicked))
        } else {
            barButton = UIBarButtonItem(image: UIImage(systemName: Constants.ImageName.heart), landscapeImagePhone: nil, style: .done, target: self, action: #selector(favoriteButtonClicked))
        }
        barButton.tintColor = .systemRed
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func configureViews(meal: Meal) {
        addBasket.layer.cornerRadius = 5
        addBasket.clipsToBounds = true
        
        if let url = URL(string: "\(Constants.URLs.downloadImageURL(image: meal._mealImageName))") {
            DispatchQueue.main.async {
                self.mealImageView.kf.setImage(with: url)
            }
        }
        mealNameLabel.text = meal._mealName
        mealPriceLabel.text = "₺\(meal._mealPrice)"
        
        mealPrice = Int(meal._mealPrice) ?? 0
        
        pieceStepper.value = 1
        pieceLabel.text = "\(Int(pieceStepper.value))"
        totalPriceLabel.text = "₺\(meal._mealPrice)"
    }
    
    @objc func favoriteButtonClicked() {
        if barButton.image == UIImage(systemName: Constants.ImageName.heart) {
            guard let meal = meal else { return }
            mealDetailScreenPresenterObject?.addFavorite(mealId: meal._mealId)
            favorite = true
            barButton.image = UIImage(systemName: Constants.ImageName.heartFill)
        } else {
            guard let key = key else { return }
            mealDetailScreenPresenterObject?.deleteFavorite(key: key)
            barButton.image = UIImage(systemName: Constants.ImageName.heart)
        }
    }
}

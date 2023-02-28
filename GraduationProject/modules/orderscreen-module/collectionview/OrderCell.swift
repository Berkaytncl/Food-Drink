//
//  OrderCell.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 16.02.2023.
//

import UIKit
import Kingfisher

class OrderCell: UICollectionViewCell {
    
    static let reuseID = Constants.CellReuseID.orderCell
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var mealPriceLabel: UILabel!
    @IBOutlet weak var mealPieceLabel: UILabel!
    @IBOutlet weak var mealTotalPriceLabel: UILabel!
    
    var cellProtocol: OrderCellProtocol?
    var indexPath: IndexPath?
    
    override func prepareForReuse() {
        super.prepareForReuse()
            
        mealImageView.image = nil
        mealImageView.kf.cancelDownloadTask()
    }
    
    func setCell(modifiedBasketMeal: BasketMealItem) {
        configureCell()
        
        if let url = URL(string: "\(Constants.URLs.downloadImageURL(image: modifiedBasketMeal.mealImageName))") {
            DispatchQueue.main.async {
                self.mealImageView.kf.setImage(with: url)
            }
        }
        mealLabel.text = modifiedBasketMeal.mealName
        mealPriceLabel.text = "₺\(modifiedBasketMeal.mealPrice)"
        mealPieceLabel.text = modifiedBasketMeal.mealOrderPiece.description
        
        let price = Int(modifiedBasketMeal.mealPrice) ?? 0
        let piece = Int(modifiedBasketMeal.mealOrderPiece) ?? 0
        mealTotalPriceLabel.text = "₺\(price * piece)"
    }
    
    private func configureCell() {
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
    }
    
    @IBAction func deleteFromBasketButton(_ sender: Any) {
        guard let indexPath = indexPath else { return }
        cellProtocol?.deleteBasketPressed(indexPath: indexPath)
    }
}

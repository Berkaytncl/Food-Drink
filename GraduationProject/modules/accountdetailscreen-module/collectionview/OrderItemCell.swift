//
//  OrderItemCell.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 26.02.2023.
//

import UIKit
import Kingfisher

class OrderItemCell: UICollectionViewCell {
    
    static let reuseID = Constants.CellReuseID.orderItemCell
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealPrice: UILabel!
    @IBOutlet weak var mealPiece: UILabel!
    
    func setCell(orderItem: OrderItem) {
        configureCell()
        
        mealNameLabel.text = orderItem._mealName
        mealPrice.text = "₺\(orderItem._mealPrice)"
        mealPiece.text = "x\(orderItem._mealOrderPiece)"

        if let url = URL(string: "\(Constants.URLs.downloadImageURL(image: orderItem._mealImageName))") {
            DispatchQueue.main.async {
                self.mealImageView.kf.setImage(with: url)
            }
        }
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
    
}

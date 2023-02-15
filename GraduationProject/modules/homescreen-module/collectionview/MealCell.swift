//
//  MealCell.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 9.02.2023.
//

import UIKit
import Kingfisher

class MealCell: UICollectionViewCell {
    
    static let reuseID = Constants.CellReuseID.mealCell
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var mealPriceLabel: UILabel!
    @IBOutlet weak var mealStepper: UIStepper!
    
    override func prepareForReuse() {
        super.prepareForReuse()
            
        mealImageView.image = nil
        mealImageView.kf.cancelDownloadTask()
    }
    
    func setCell(meal: Meal) {
        configureCell()
        
        if let url = URL(string: "\(Constants.URLs.downloadImageURL(image: meal._mealImageName))") {
            DispatchQueue.main.async {
                self.mealImageView.kf.setImage(with: url)
            }
        }
        mealLabel.text = meal._mealName
        mealPriceLabel.text = "₺\(meal._mealPrice)"
    }
    
    private func configureCell() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    @IBAction func addBasketButton(_ sender: Any) {
        
    }
}

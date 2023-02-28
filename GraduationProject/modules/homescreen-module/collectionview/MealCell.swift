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
    @IBOutlet weak var addFavorite: UIButton!
    
    var favorite: Bool?
    var cellProtocol: MealCellProtocol?
    var indexPath: IndexPath?
    
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
        
        setFavoriteButton()
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
    
    func setFavoriteButton() {
        guard let favorite = favorite else { return }
        if favorite {
            addFavorite.setImage(UIImage(systemName: Constants.ImageName.heartFill), for: .normal)
        } else {
            addFavorite.setImage(UIImage(systemName: Constants.ImageName.heart), for: .normal)
        }
    }
    
    @IBAction func addFavoriteButton(_ sender: Any) {
        guard let favorite = favorite else { return }
        guard let indexPath = indexPath else { return }
        if favorite {
            cellProtocol?.deleteFavorite(indexPath: indexPath)
            addFavorite.setImage(UIImage(systemName: Constants.ImageName.heart), for: .normal)
        } else {
            cellProtocol?.addFavorite(indexPath: indexPath)
            addFavorite.setImage(UIImage(systemName: Constants.ImageName.heartFill), for: .normal)
        }
    }
    
    @IBAction func addBasketButton(_ sender: Any) {
        guard let indexPath = indexPath else { return }
        cellProtocol?.addBasketPressed(indexPath: indexPath)
    }
}

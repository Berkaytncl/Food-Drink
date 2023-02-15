//
//  HomeScreen.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import UIKit

class HomeScreen: UIViewController {

    @IBOutlet weak var watchDeliveryButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var homeScreenPresenterObject: ViewToPresenterHomeScreenProtocol?
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeScreenRouter.createModule(ref: self)
        
        configureViews()
        configureCollectionView()
        
        homeScreenPresenterObject?.uploadMeals()
        
    }

    @IBAction func watchDeliveryButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: Constants.Destination.toWatchDeliveryScreen, sender: nil)
    }
}

extension HomeScreen : PresenterToViewHomeScreenProtocol {
    func dataSendToView(meals: [Meal]) {
        self.meals = meals
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCell.reuseID, for: indexPath) as? MealCell else { return UICollectionViewCell() }
        
        cell.setCell(meal: meals[indexPath.item])
        
        return cell
    }
}

extension HomeScreen {
    func configureViews() {
        watchDeliveryButton.isHidden = true
    }
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .clear
        
        let layout = UIHelper.createHomeFlowLayout()
        collectionView.collectionViewLayout = layout
    }
}

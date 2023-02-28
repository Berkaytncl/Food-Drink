//
//  HomeScreen.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 8.02.2023.
//

import UIKit
import Firebase

class HomeScreen: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var favoriteFilter: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    private var refreshControl = UIRefreshControl()
    
    var homeScreenPresenterObject: ViewToPresenterHomeScreenProtocol?
    
    private var meals = [Meal]()
    private var favoriteMeals = [FavoriteMeal]()

    private var sortType: SortType = .defaultSorting
    private var favoriteRestriction: FavoriteRestriction = .allMeals
    private var viewDidLoadRun: Bool = false
    private var toastLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeScreenRouter.createModule(ref: self)
        
        homeScreenPresenterObject?.uploadMeals(favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
        
        viewDidLoadRun = true

        configureCollectionView()
        configureNameLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        homeScreenPresenterObject?.getFavoriteMeals()
        
        if viewDidLoadRun {
            viewDidLoadRun = false
        } else {
            changeSortType(sortType: sortType)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction func sortButton(_ sender: Any) {
        performSegue(withIdentifier: Constants.Destination.toSortScreen, sender: nil)
    }
    
    @IBAction func favoriteFilterButton(_ sender: Any) {
        if favoriteRestriction == .favoriteMeals {
            favoriteRestriction = .allMeals
            homeScreenPresenterObject?.uploadMeals(favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
            favoriteFilter.setImage(UIImage(systemName: Constants.ImageName.heart), for: .normal)
        } else {
            favoriteRestriction = .favoriteMeals
            homeScreenPresenterObject?.mealsRestrictionOrSortChanged(meals: meals, favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
            favoriteFilter.setImage(UIImage(systemName: Constants.ImageName.heartFill), for: .normal)
        }
    }
    
}

extension HomeScreen : PresenterToViewHomeScreenProtocol {
    func dataSendToView(meals: [Meal]) {
        self.meals.removeAll(keepingCapacity: true)
        self.meals = meals
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func dataSendToView(favoriteMeals: [FavoriteMeal]) {
        self.favoriteMeals.removeAll(keepingCapacity: true)
        self.favoriteMeals = favoriteMeals
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func successfulTransactionInformationToView(mealName: String, piece: Int) {
        showToast(message: "\(piece) piece \(mealName) added to basket.", font: .boldSystemFont(ofSize: 16))
    }
    
    func showToast(message : String, font: UIFont) {
        toastLabel = UILabel(frame: CGRect(x: 25, y: self.view.frame.size.height-150, width: self.view.frame.size.width - 50, height: 50))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(1)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 8
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.05, options: .curveEaseOut, animations: {
            self.toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            self.toastLabel.removeFromSuperview()
        })
    }
}

extension HomeScreen: SortScreenDelegate {
    func sortScreenResponse(sortType: SortType) {
        changeSortType(sortType: sortType)
    }
}

extension HomeScreen : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            homeScreenPresenterObject?.uploadMeals(favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
        } else {
            homeScreenPresenterObject?.search(searchText: searchText, favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
        }
    }
}

extension HomeScreen: MealCellProtocol {
    func addFavorite(indexPath: IndexPath) {
        homeScreenPresenterObject?.addFavorite(mealId: meals[indexPath.item]._mealId)
    }
    
    func deleteFavorite(indexPath: IndexPath) {
        let mealId = meals[indexPath.item]._mealId
        var key = ""
        favoriteMeals.forEach { favoriteMeal in
            if favoriteMeal._mealId == mealId { key = favoriteMeal._key }
        }
        homeScreenPresenterObject?.deleteFavorite(key: key)
    }
    
    func addBasketPressed(indexPath: IndexPath) {
        let meal = meals[indexPath.item]
        homeScreenPresenterObject?.addBasket(meal: meal)
    }
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCell.reuseID, for: indexPath) as? MealCell else { return UICollectionViewCell() }
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        cell.favorite = favoriteMeals.contains { $0._mealId == meals[indexPath.item]._mealId }
        
        cell.setCell(meal: meals[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meal = meals[indexPath.item]
        var isFavorite = false
        var key = ""
        favoriteMeals.forEach { favoriteMeal in
            if favoriteMeal._mealId == meal._mealId {
                isFavorite = true
                key = favoriteMeal._key
            }
        }
        let mealDetail = (meal, isFavorite, key)
        collectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: Constants.Destination.toMealDetailScreen, sender: mealDetail)
    }
}

extension HomeScreen {
    
    func configureCollectionView() {
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        collectionView.addSubview(refreshControl)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .clear
        
        let layout = UIHelper.createHomeFlowLayout()
        collectionView.collectionViewLayout = layout
    }
    
    func configureNameLabel() {
        guard let user = Auth.auth().currentUser?.email else { return }
        let index = user.firstIndex(of: "@") ?? user.endIndex
        let name = user[..<index]
        nameLabel.text = "Hi \(name.capitalized)!"
    }
    
    func changeSortType(sortType: SortType) {
        self.sortType = sortType
        homeScreenPresenterObject?.mealsRestrictionOrSortChanged(meals: meals, favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
    }
    
    @objc func refresh(send: UIRefreshControl) {
        searchBar.text = ""
        homeScreenPresenterObject?.uploadMeals(favoriteMeals: favoriteMeals, sortType: sortType, favoriteRestriction: favoriteRestriction)
        refreshControl.endRefreshing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Destination.toMealDetailScreen {
            if let mealDetail = sender as? (Meal, Bool, String) {
                let destinationVC = segue.destination as? MealDetailScreen
                destinationVC?.mealDetail = mealDetail
            }
        } else if segue.identifier == Constants.Destination.toSortScreen {
            let destinationVC = segue.destination as? SortScreen
            destinationVC?.delegate = self
        }
    }
}

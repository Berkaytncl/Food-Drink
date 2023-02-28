//
//  OnboardingScreen.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 27.02.2023.
//

import UIKit

class OnboardingScreen: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let slides: [Slide] = Slide.collection
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        configurePageControl()
    }

    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
        
        let layout = UIHelper.createOnboardingFlowLayout()
        collectionView.collectionViewLayout = layout
    }
    
    func configurePageControl() {
        pageControl.numberOfPages = slides.count
        
        let angle = CGFloat.pi/2
        pageControl.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    func handleActionButtonTap(at indexPath: IndexPath) {
        if indexPath.item == slides.count - 1 {
            performSegue(withIdentifier: Constants.Destination.toLoginScreenFromOnboard, sender: nil)
        } else {
            let nextItem = indexPath.item + 1
            let nextIndexPath = IndexPath(item: nextItem, section: 0)
            collectionView.scrollToItem(at: nextIndexPath, at: .top, animated: true)
            pageControl.currentPage = nextItem
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(collectionView.contentOffset.y / scrollView.frame.size.height)
        pageControl.currentPage = index
    }
}

extension OnboardingScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.reuseID, for: indexPath) as? OnboardingCell else { return UICollectionViewCell() }
        
        let slide = slides[indexPath.item]
        cell.setCell(with: slide)
        cell.actionButtonDidTap = { [weak self] in
            self?.handleActionButtonTap(at: indexPath)
        }
        
        return cell
    }
}

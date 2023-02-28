//
//  UIHelper.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 10.02.2023.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8

        let itemWidth = (CGFloat.deviceWidth - 24) / 2
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.3)
        
        return layout
    }
    
    static func createOrderFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8

        let itemWidth = CGFloat.deviceWidth - 16
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth / 3)
        
        return layout
    }
    
    static func createAccountDetailFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 16
        
        layout.scrollDirection = .horizontal

        let itemWidth = 130
        let itemHeight = 130
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        return layout
    }
    
    static func createOnboardingFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        layout.scrollDirection = .vertical
        
        let itemWidth = CGFloat.deviceWidth
        let itemHeight = CGFloat.deviceHeight
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        return layout
    }
}

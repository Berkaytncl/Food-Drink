//
//  OnboardingCell.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 27.02.2023.
//

import UIKit
import Lottie

class OnboardingCell: UICollectionViewCell {
    
    static let reuseID = Constants.CellReuseID.onboardingCell
    
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var actionButtonDidTap: (() -> Void)?
    
    func setCell(with slide: Slide) {
        titleLabel.text = slide.title
        actionButton.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .bold)
        actionButton.setTitle(slide.buttonTitle, for: .normal)
        actionButton.backgroundColor = slide.buttonColor
        
        animationView.animation = .asset(slide.animationName)
        animationView.loopMode = .loop
        
        if !animationView.isAnimationPlaying {
            animationView.play()
        }
    }
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        actionButtonDidTap?()
    }
}

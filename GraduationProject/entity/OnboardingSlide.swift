//
//  OnboardingSlide.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 28.02.2023.
//

import UIKit

struct Slide {
    let title: String
    let animationName: String
    let buttonColor: UIColor
    let buttonTitle: String
    
    static let collection: [Slide] = [
        .init(title: "Get your favorite food delivered to you under 30 minutes anytime", animationName: "lottieDeliveryGuy", buttonColor: .systemYellow, buttonTitle: "Next"),
        .init(title: "We serve only from choiced dishes.", animationName: "lottieFoodCarousel", buttonColor: .systemGreen, buttonTitle: "Order Now")
    ]
}

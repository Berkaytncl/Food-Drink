//
//  SortType.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 22.02.2023.
//

import Foundation

enum SortType: CaseIterable {
    case defaultSorting
    case ascendingAlphabetically
    case descendingAlphabetically
    case increasingByPrice
    case decreasingByPrice
}

protocol SortTypeProperty {
    var sortTypeString: String { get }
}

extension SortType: SortTypeProperty {
    var sortTypeString: String {
        switch self {
        case .defaultSorting:
            return Constants.Sort.defaultSorting
        case .ascendingAlphabetically:
            return Constants.Sort.ascendingAlphabetically
        case .descendingAlphabetically:
            return Constants.Sort.descendingAlphabetically
        case .increasingByPrice:
            return Constants.Sort.increasingByPrice
        case .decreasingByPrice:
            return Constants.Sort.decreasingByPrice
        }
    }
}

//
//  String+Ext.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 9.02.2023.
//

import Foundation

extension String? {
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}

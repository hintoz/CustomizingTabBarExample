//
//  Item.swift
//  CustomizingTabBarExample
//
//  Created by Евгений Дац on 09/01/2019.
//  Copyright © 2019 Evgeny Dats. All rights reserved.
//

import Foundation

enum TabBarItemTag: String, CaseIterable {
    case home, find, photo, favor, me, message, shop, cardboard

    var title: String {
        return rawValue.capitalized
    }
    
    var image: String {
        return rawValue
    }
    
    var selectedImage: String {
        return "\(rawValue)_1"
    }
}

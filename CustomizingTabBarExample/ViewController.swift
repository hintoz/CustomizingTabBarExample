//
//  ViewController.swift
//  CustomizingTabBarExample
//
//  Created by hintoz on 02.05.17.
//  Copyright © 2017 Evgeny Dats. All rights reserved.
//

import UIKit

enum TabBarItemTag: Int {
    case home = 0
    case find = 1
    case photo = 2
    case favor = 3
    case me = 4
    case message = 5
    case shop = 6
    case cardboard = 7
    
    func getValue() -> Int {
        return self.rawValue
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "\(self.tabBarItem.tag)"
        
        switch self.tabBarItem.tag {
        case TabBarItemTag.home.getValue():
            self.navigationItem.title = "Home"
        case TabBarItemTag.find.getValue():
            self.navigationItem.title = "Find"
        case TabBarItemTag.photo.getValue():
            self.navigationItem.title = "Photo"
        case TabBarItemTag.favor.getValue():
            self.navigationItem.title = "Favor"
        case TabBarItemTag.me.getValue():
            self.navigationItem.title = "Me"
        case TabBarItemTag.message.getValue():
            self.navigationItem.title = "Message"
        case TabBarItemTag.shop.getValue():
            self.navigationItem.title = "Shop"
        case TabBarItemTag.cardboard.getValue():
            self.navigationItem.title = "Cardboard"
        default:
            break
        }
    }

}


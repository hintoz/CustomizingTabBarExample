//
//  ViewController.swift
//  CustomizingTabBarExample
//
//  Created by hintoz on 02.05.17.
//  Copyright © 2017 Evgeny Dats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Tag \(tabBarItem.tag)"
        navigationItem.title = TabBarItemTag.allCases[tabBarItem.tag].title
    }

}


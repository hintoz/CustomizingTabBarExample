//
//  TabBarViewController.swift
//  CustomizingTabBarExample
//
//  Created by hintoz on 02.05.17.
//  Copyright © 2017 Evgeny Dats. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    let tabBarOrderKey = "tabBarOrderKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        configureVtewControllers()
        setUpTabBarItemTags()
        getSavedTabBarItemsOrder()
    }
    
    func configureVtewControllers() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let n1 = storyBoard.instantiateViewController(withIdentifier: "navVC") as! NavigationViewController
        let n2 = storyBoard.instantiateViewController(withIdentifier: "navVC") as! NavigationViewController
        let n3 = storyBoard.instantiateViewController(withIdentifier: "navVC") as! NavigationViewController
        let n4 = storyBoard.instantiateViewController(withIdentifier: "navVC") as! NavigationViewController
        let n5 = storyBoard.instantiateViewController(withIdentifier: "navVC") as! NavigationViewController
        let n6 = storyBoard.instantiateViewController(withIdentifier: "navVC") as! NavigationViewController
        let n7 = storyBoard.instantiateViewController(withIdentifier: "navVC") as! NavigationViewController
        let n8 = storyBoard.instantiateViewController(withIdentifier: "navVC") as! NavigationViewController
        
        
        n1.viewControllers.first?.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        n2.viewControllers.first?.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        n3.viewControllers.first?.tabBarItem = UITabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        n4.viewControllers.first?.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        n5.viewControllers.first?.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        n6.viewControllers.first?.tabBarItem = UITabBarItem.init(title: "Message", image: UIImage(named: "message"), selectedImage: UIImage(named: "message_1"))
        n7.viewControllers.first?.tabBarItem = UITabBarItem.init(title: "Shop", image: UIImage(named: "shop"), selectedImage: UIImage(named: "shop_1"))
        n8.viewControllers.first?.tabBarItem = UITabBarItem.init(title: "Cardboard", image: UIImage(named: "cardboard"), selectedImage: UIImage(named: "cardboard_1"))
        
        
        self.viewControllers = [n1, n2, n3, n4, n5, n6, n7, n8]
    }
    
    func setUpTabBarItemTags() {
        var tag = 0
        if let viewControllers = viewControllers {
            for view in viewControllers {
                view.tabBarItem.tag = tag
                tag += 1
            }
        }
    }
    
    func getSavedTabBarItemsOrder() {
        var newViewControllerOrder = [UIViewController]()
        if let initialViewControllers = viewControllers {
            if let tabBarOrder = UserDefaults.standard.object(forKey: tabBarOrderKey) as? [Int] {
                for tag in tabBarOrder {
                    newViewControllerOrder.append(initialViewControllers[tag])
                }
                setViewControllers(newViewControllerOrder, animated: false)
                print("loaded ViewControllers from UserDefaults")
            }
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        var orderedTagItems = [Int]()
        if changed {
            for viewController in viewControllers {
                let tag = viewController.tabBarItem.tag
                orderedTagItems.append(tag)
                
            }
            UserDefaults.standard.set(orderedTagItems, forKey: tabBarOrderKey)
            print("changed")
            print(orderedTagItems)
        } else {
            print("not changed")
        }
    }

}

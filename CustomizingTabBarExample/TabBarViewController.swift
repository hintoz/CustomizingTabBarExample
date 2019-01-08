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
        
        configItewControllers()
        setUpTabBarItemTags()
        getSavedTabBarItemsOrder()
        
        guard AppDelegate.isDark else { return }
        tabBar.tintColor = UIColor.green
        tabBar.barTintColor = UIColor.black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard AppDelegate.isDark else { return }
        configMoreViewController()
    }
    
    func configItewControllers() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var conrollers = [NavigationViewController]()
        
        for index in 0..<TabBarItemTag.allCases.count {
            let conroller = storyBoard.instantiateViewController(withIdentifier: "navVC") as! NavigationViewController
            let item = TabBarItemTag.allCases[index]
            conroller.viewControllers.first?.tabBarItem = UITabBarItem.init(title: item.title, image: UIImage(named: item.image), selectedImage: UIImage(named: item.selectedImage))
            conrollers.append(conroller)
        }
        
        self.viewControllers = conrollers
    }
    
    func configMoreViewController() {
        moreNavigationController.navigationBar.barStyle = .black
        moreNavigationController.navigationBar.tintColor = UIColor.white
        moreNavigationController.topViewController?.view.backgroundColor = UIColor.black
        (moreNavigationController.topViewController?.view as? UITableView)?.separatorStyle = .none
        (moreNavigationController.topViewController?.view as? UITableView)?.tintColor = UIColor.lightGray
        if let cells = (moreNavigationController.topViewController?.view as? UITableView)?.visibleCells {
            for cell in cells {
                cell.backgroundColor = UIColor.clear
                cell.textLabel?.textColor = UIColor.lightGray
            }
        }
    }
    
    func setUpTabBarItemTags() {
        guard let viewControllers = viewControllers else { return }
        for (index, view) in viewControllers.enumerated() {
            view.tabBarItem.tag = index
        }
    }
    
    func getSavedTabBarItemsOrder() {
        guard let initialViewControllers = viewControllers else { return }
        guard let tabBarOrder = UserDefaults.standard.object(forKey: tabBarOrderKey) as? [Int] else { return }
        guard tabBarOrder.count == initialViewControllers.count else {
            UserDefaults.standard.set(nil, forKey: tabBarOrderKey)
            return
        }
        var newViewControllerOrder = [UIViewController]()
        for tag in tabBarOrder {
            newViewControllerOrder.append(initialViewControllers[tag])
        }
        setViewControllers(newViewControllerOrder, animated: false)
        print("loaded ViewControllers from UserDefaults")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        guard changed else { print("not changed"); return }
        var orderedTagItems = [Int]()
        for viewController in viewControllers {
            orderedTagItems.append(viewController.tabBarItem.tag)
        }
        UserDefaults.standard.set(orderedTagItems, forKey: tabBarOrderKey)
        print("changed")
        print(orderedTagItems)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, willBeginCustomizing viewControllers: [UIViewController]) {
        guard AppDelegate.isDark else { return }
        (tabBarController.view.subviews[1].subviews[1] as? UINavigationBar)?.barStyle = .black
        (tabBarController.view.subviews[1].subviews[1] as? UINavigationBar)?.tintColor = UIColor.white
        tabBarController.view.subviews[1].backgroundColor = UIColor.black
        tabBarController.view.subviews[1].tintColor = UIColor.green
    }

}

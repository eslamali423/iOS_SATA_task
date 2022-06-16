//
//  MainTapBarViewController.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import UIKit

@available(iOS 13.0, *)
class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        selectedIndex = 2
    
        let vc1 = UINavigationController(rootViewController: SettingsViewController())
        let vc2 = UINavigationController(rootViewController: SavedViewController())
        let vc3 = UINavigationController(rootViewController: HomeViewController())
 
    
        vc1.tabBarItem.image = UIImage(systemName: "gearshape.2")
        vc2.tabBarItem.image = UIImage(systemName: "bookmark")
        vc3.tabBarItem.image = UIImage(systemName: "house")

        vc1.title = "الأعدادات"
        vc2.title = "المفضلة"
        vc3.title = "الرئيسة"
        
        
    
        tabBar.tintColor  = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        // for change font for TabBar
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "Cairo-Bold", size: 10)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: [])

        
        setViewControllers([vc1,vc2,vc3], animated: false)
        
    }


}


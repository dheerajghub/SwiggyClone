//
//  TabBarViewController.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/03/22.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate{

    // MARK: PROPERTIES -
    
    var foodViewController:UIViewController!
    var searchViewController:UIViewController!
    
    var tabItem = UITabBarItem()
    
    // MARK: MAIN -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        self.delegate = self
        
        let vc1 = FoodViewController()
        foodViewController = UINavigationController(rootViewController: vc1)
        
        let vc2 = SearchViewController()
        searchViewController = UINavigationController(rootViewController: vc2)
        
        viewControllers = [foodViewController , searchViewController]
        
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.barTintColor = .white
        
        customTab(selectedImage: "ic_food", deselectedImage: "ic_food_selected", indexOfTab: 0 , tabTitle: "")
        customTab(selectedImage: "ic_search", deselectedImage: "ic_search_selected", indexOfTab: 1 , tabTitle: "")
    }
    
    func customTab(selectedImage image1 : String , deselectedImage image2: String , indexOfTab index: Int , tabTitle title: String ){

        let selectedImage = UIImage(named: image1)
        let deselectedImage = UIImage(named: image2)
        
        tabItem = self.tabBar.items![index]
        tabItem.image = deselectedImage
        tabItem.selectedImage = selectedImage
        tabItem.title = .none
        tabItem.imageInsets.bottom = -11
    }

}

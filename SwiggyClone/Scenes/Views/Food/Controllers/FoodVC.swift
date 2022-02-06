//
//  FoodVC.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import UIKit

class FoodVC: UIViewController {

    // MARK: PROPERTIES -
    
    let cellId = "cellId"
    let foodVCHeaderViewId = "FoodVCFilterHeaderView"
    let sectionHeaderViewId = "SectionHeaderView"
    let sectionFooterViewId = "SectionFooterView"
    let sectionHeaderView2Id = "SectionHeaderView_2"
    let filterLaucher = FilterLauncher()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero , collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        
        cv.register(FoodTopBannerCVCell.self, forCellWithReuseIdentifier: "FoodTopBannerCVCell")
        cv.register(FoodCategoryCVCell.self, forCellWithReuseIdentifier: "FoodCategoryCVCell")
        cv.register(FoodSuggestionCardCVCell.self, forCellWithReuseIdentifier: "FoodSuggestionCardCVCell")
        cv.register(RestaurantsListCVCell.self, forCellWithReuseIdentifier: "RestaurantsListCVCell")
        cv.register(RestaurantVeganCVCell.self, forCellWithReuseIdentifier: "RestaurantVeganCVCell")
        
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        cv.register(FoodFilterHeaderView.self, forSupplementaryViewOfKind: headerKind, withReuseIdentifier: foodVCHeaderViewId)
        cv.register(SectionHeaderView.self, forSupplementaryViewOfKind: headerKind, withReuseIdentifier: sectionHeaderViewId)
        cv.register(SectionFooterView.self, forSupplementaryViewOfKind: footerKind, withReuseIdentifier: sectionFooterViewId)
        cv.register(SectionHeaderView_2.self, forSupplementaryViewOfKind: headerKind, withReuseIdentifier: sectionHeaderView2Id)
        
        cv.backgroundColor = .white
        
        return cv
    }()
    
    lazy var filterHeaderView: FoodFilterHeaderView = {
        let v = FoodFilterHeaderView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isHidden = true
        v.delegate = self
        return v
    }()
    
    // MARK: MAIN -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigations()
        setUpViews()
        setUpConstraints()
        configureCompositionalLayout()
    }
    
    // MARK: FUNCTIONS -
    
    func setUpNavigations(){
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundImage = UIImage()
            appearance.backgroundColor = .white
            appearance.shadowColor = .clear
            navigationController?.navigationBar.standardAppearance = appearance;
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
        
        let homeBtn = UIButton()
        homeBtn.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        homeBtn.setButtonTitleWithRightImage(title: "Home".uppercased(), btnImage: "ic_arrow_down", customFont: UIFont.customFont(ofType: .bold, withSize: 16), color: .black, imageColor: .black, imageSize: 20)
        let leftBarButtonItem = UIBarButtonItem(customView: homeBtn)
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
    }
    
    func setUpViews(){
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(filterHeaderView)
        
        for family in UIFont.familyNames {
            print("family:", family)
            for font in UIFont.fontNames(forFamilyName: family) {
                print("font:", font)
            }
        }
        
    }
    
    func setUpConstraints(){
        collectionView.pin(to: view)
        NSLayoutConstraint.activate([
            filterHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterHeaderView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

}

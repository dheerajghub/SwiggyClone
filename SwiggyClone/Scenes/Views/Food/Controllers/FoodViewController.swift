//
//  FoodVC.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import UIKit

class FoodViewController: UIViewController {

    // MARK: PROPERTIES -
    
    let filterLaucher = FilterLauncher()
    
    let navView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero , collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        
        cv.register(FoodTopBannerCVCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.foodTopBannerId)
        cv.register(FoodCategoryCVCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.foodCategoryId)
        cv.register(FoodSuggestionCardCVCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.foodSuggestionCardId )
        cv.register(RestaurantsListCVCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.restaurantListId)
        cv.register(RestaurantVeganCVCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.restaurantVeganId)
        
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.cellId)
        
        cv.register(FoodFilterHeaderView.self, forSupplementaryViewOfKind: headerKind, withReuseIdentifier: Key.ReusableIdentifiers.foodVCHeaderViewId)
        cv.register(SectionHeaderView.self, forSupplementaryViewOfKind: headerKind, withReuseIdentifier: Key.ReusableIdentifiers.sectionHeaderViewId)
        cv.register(SectionFooterView.self, forSupplementaryViewOfKind: footerKind, withReuseIdentifier: Key.ReusableIdentifiers.sectionFooterViewId)
        cv.register(SectionHeaderView_2.self, forSupplementaryViewOfKind: headerKind, withReuseIdentifier: Key.ReusableIdentifiers.sectionHeaderView2Id)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavigations()
    }
    
    // MARK: FUNCTIONS -
    
    func setUpNavigations(){
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = false
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundImage = UIImage()
            appearance.backgroundColor = .white
            appearance.shadowColor = .clear
            appearance.configureWithTransparentBackground()
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
        view.addSubview(navView)
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
            
            navView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navView.topAnchor.constraint(equalTo: view.topAnchor, constant: -(windowConstant.getTopPadding + 64)),
            navView.heightAnchor.constraint(equalToConstant: windowConstant.getTopPadding + 64),
            
            filterHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterHeaderView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

}

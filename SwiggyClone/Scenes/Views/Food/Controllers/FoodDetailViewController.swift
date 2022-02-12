//
//  FoodDetailViewController.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 12/02/22.
//

import UIKit

class FoodDetailViewController: UIViewController {

    // MARK: PROPERTIES -
    
    let filterLaucher = FilterLauncher()
    
    lazy var navView: FoodDetailNavView = {
        let v = FoodDetailNavView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.delegate = self
        v.isUserInteractionEnabled = true
        return v
    }()
    
    lazy var filterHeaderView: FoodFilterHeaderView = {
        let v = FoodFilterHeaderView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isHidden = true
        v.delegate = self
        return v
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero , collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
    
        cv.register(FoodTopBannerCVCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.foodTopBannerId)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.cellId)
        cv.register(RestaurantsListCVCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.restaurantListId)
        cv.register(FoodFilterHeaderView.self, forSupplementaryViewOfKind: headerKind, withReuseIdentifier: Key.ReusableIdentifiers.foodVCHeaderViewId)
        
        cv.backgroundColor = .white
        cv.bounces = false
        
        return cv
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
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = true
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundImage = UIImage()
            appearance.backgroundColor = .clear
            appearance.shadowColor = .clear
            appearance.configureWithTransparentBackground()
            navigationController?.navigationBar.standardAppearance = appearance;
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
        
        navigationItem.hidesBackButton = true
    }
    
    func setUpViews(){
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(navView)
        view.addSubview(filterHeaderView)
        
        filterHeaderView.title.text = "\(restaurantListMockData.count) restaurants".uppercased()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -(windowConstant.getTopPadding)),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            navView.topAnchor.constraint(equalTo: view.topAnchor),
            navView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navView.heightAnchor.constraint(equalToConstant: windowConstant.getTopPadding + 50),
            
            filterHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterHeaderView.topAnchor.constraint(equalTo: navView.bottomAnchor),
            filterHeaderView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = (scrollView.contentOffset.y + 47)
        let offset = abs(yOffset)
        let showAt = 260.0
        let alphaRatio = 1.0 - ((showAt - offset) / showAt)
        
        navView.coverView.alpha = alphaRatio
        navView.navCardView.alpha = alphaRatio
        
        if alphaRatio > 0.7 {
            navView.backBtn.alpha = 0
            navView.cardView.isHidden = true
        } else {
            navView.cardView.isHidden = false
            navView.backBtn.alpha = 1
        }
        
        print(yOffset)
        
        /// Unhiding the filter header!
        if yOffset > 294 + 47 {
            filterHeaderView.isHidden = false
            filterHeaderView.isStickHeader = true
        } else {
            filterHeaderView.isHidden = true
            filterHeaderView.isStickHeader = false
        }
        
    }
    
}

//
//  FoodDetailViewController+Delegate.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 12/02/22.
//

import UIKit

extension FoodDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return restaurantListMockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.foodTopBannerId, for: indexPath) as! FoodTopBannerCVCell
            cell.bannerImage.image = UIImage(named: "ic_d_banner")
            cell.bannerImage.layer.cornerRadius = 0
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.restaurantListId, for: indexPath) as! RestaurantsListCVCell
        cell.data = restaurantListMockData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Key.ReusableIdentifiers.foodVCHeaderViewId, for: indexPath) as! FoodFilterHeaderView
        header.delegate = self
        header.title.text = "\(restaurantListMockData.count) restaurants".uppercased()
        return header
    }
    
}


extension FoodDetailViewController: FoodFilterHeaderActionDelegate, FoodDetailNavActionDelegate {
    
    func didBackBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func didFilterBtnTapped() {
        filterLaucher.showFilter()
    }
    
    func configureCompositionalLayout() {
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) in
            if sectionNumber == 0 {
                return LayoutType.foodDetailBannerLayout.getLayout()
            }
            return LayoutType.foodListLayout.getLayout(withHeader: true)
        }
        collectionView.setCollectionViewLayout(layout, animated: true )
    }
    
}

//
//  FoodVC+Extension.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 29/01/22.
//

import UIKit

extension FoodVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return foodTopBannerMockData.count
        } else if section == 1 {
            return foodCategoryMockData.count
        } else if section == 3 {
            return curatedRestaurantsMockData.count
         } else if section == 5 {
             return veganRestaurantMockData.count
         }
        return restaurantListMockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.foodTopBannerId, for: indexPath) as! FoodTopBannerCVCell
            cell.data = foodTopBannerMockData[indexPath.row]
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.foodCategoryId, for: indexPath) as! FoodCategoryCVCell
            cell.data = foodCategoryMockData[indexPath.row]
            return cell
        } else if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.foodSuggestionCardId, for: indexPath) as! FoodSuggestionCardCVCell
            cell.data = curatedRestaurantsMockData[indexPath.row]
            return cell
        } else if indexPath.section == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.restaurantVeganId, for: indexPath) as! RestaurantVeganCVCell
            cell.data = veganRestaurantMockData[indexPath.row]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.restaurantListId, for: indexPath) as! RestaurantsListCVCell
        cell.data = restaurantListMockData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == headerKind {
            if indexPath.section == 2 {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Key.ReusableIdentifiers.foodVCHeaderViewId, for: indexPath) as! FoodFilterHeaderView
                header.delegate = self
                return header
            }
            if indexPath.section == 5 {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Key.ReusableIdentifiers.sectionHeaderView2Id, for: indexPath) as! SectionHeaderView_2
                return header
            }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Key.ReusableIdentifiers.sectionHeaderViewId, for: indexPath) as! SectionHeaderView
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Key.ReusableIdentifiers.sectionFooterViewId, for: indexPath) as! SectionFooterView
            return footer
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let VC = FoodDetailViewController()
            navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FoodTopBannerCVCell {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                cell.bannerImage.transform = .init(scaleX: 0.95, y: 0.95)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FoodTopBannerCVCell {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                cell.bannerImage.transform = .identity
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if abs(yOffset) > 350.0 {
            filterHeaderView.isHidden = false
            filterHeaderView.isStickHeader = true
        } else {
            filterHeaderView.isHidden = true
            filterHeaderView.isStickHeader = false
        }
    }
    
}

extension FoodVC {
    
    func configureCompositionalLayout() {
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) in
            if sectionNumber == 0 {
                return LayoutType.headerLayout.getLayout()
            } else if sectionNumber == 1 {
                return LayoutType.foodCategoryLayout.getLayout()
            } else if sectionNumber == 2 {
                return LayoutType.foodListLayout.getLayout()
            } else if sectionNumber == 3 {
                return LayoutType.suggestionSectionLayout.getLayout()
            } else if sectionNumber == 5 {
                return LayoutType.veganSectionLayout.getLayout()
            } else {
                return LayoutType.foodListLayout.getLayout(withHeader: false)
            }
        }
        
        layout.register(SectionDecorationView.self, forDecorationViewOfKind: sectionBackground)
        collectionView.setCollectionViewLayout(layout, animated: true )
    }
    
}

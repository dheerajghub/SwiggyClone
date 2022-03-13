//
//  SearchDetailContainerView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 12/03/22.
//

import UIKit

class SearchDetailContainerView: UIView {

    // MARK: PROPERTIES -
    
    var filterHeaderViewHeightConstraints: NSLayoutConstraint?
    
    let categoryHeaderView: SearchCategoryCustomView = {
        let view = SearchCategoryCustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let filterHeaderView: SearchFilterCustomView = {
        let view = SearchFilterCustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var searchDetailCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = Colors.appGray
        collectionView.register(DishesCollectionViewCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.dishedsContentId)
        return collectionView
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
        configureCompositionalLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        backgroundColor = Colors.appGray
        addSubview(categoryHeaderView)
        addSubview(filterHeaderView)
        addSubview(searchDetailCollectionView)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            categoryHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryHeaderView.topAnchor.constraint(equalTo: topAnchor),
            categoryHeaderView.heightAnchor.constraint(equalToConstant: 60),
            
            filterHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterHeaderView.topAnchor.constraint(equalTo: categoryHeaderView.bottomAnchor),
            
            searchDetailCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchDetailCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchDetailCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            searchDetailCollectionView.topAnchor.constraint(equalTo: filterHeaderView.bottomAnchor)
        ])
        
        filterHeaderViewHeightConstraints = filterHeaderView.heightAnchor.constraint(equalToConstant: 60)
        filterHeaderViewHeightConstraints?.isActive = true
        
    }

}

extension SearchDetailContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishedDummyListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.dishedsContentId, for: indexPath) as! DishesCollectionViewCell
        cell.data = dishedDummyListData[indexPath.row]
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.y > 0 {
            // Hide
            filterHeaderViewHeightConstraints?.constant = 2
            categoryHeaderView.dividerView.alpha = 0
        } else {
            // Unhide
            filterHeaderViewHeightConstraints?.constant = 60
            categoryHeaderView.dividerView.alpha = 1
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
}

extension SearchDetailContainerView {
    
    func configureCompositionalLayout() {
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) in
            return LayoutType.searchDetailListLayout.getLayout()
        }
        
        searchDetailCollectionView.setCollectionViewLayout(layout, animated: true )
    }
    
}

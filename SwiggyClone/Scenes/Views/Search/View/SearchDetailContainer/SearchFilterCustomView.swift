//
//  SearchFilterCustomView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 12/03/22.
//

import UIKit

class SearchFilterCustomView: UIView {

    // MARK: PROPERTIES -
    
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray.withAlphaComponent(0.2)
        return view
    }()
    
    lazy var filterOptionsCollectionview: UICollectionView = {
        let collectionview = UICollectionView(frame: .zero , collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .clear
        
        collectionview.register(SearchFiltersCollectionViewCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.searchFilterId)
        collectionview.alwaysBounceVertical = false
        
        return collectionview
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
        backgroundColor = .white
        addSubview(dividerView)
        addSubview(filterOptionsCollectionview)
    }
    
    func setUpConstraints(){
        filterOptionsCollectionview.pin(to: self)
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

extension SearchFilterCustomView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchFilterDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.searchFilterId, for: indexPath) as! SearchFiltersCollectionViewCell
        cell.data = searchFilterDummy[indexPath.row]
        return cell
    }
    
}

extension SearchFilterCustomView {
    
    func configureCompositionalLayout() {
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) in
                return LayoutType.horizontalDynamicLayout.getLayout()
        }
        
        filterOptionsCollectionview.setCollectionViewLayout(layout, animated: true )
    }
    
}

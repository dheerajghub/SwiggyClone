//
//  SearchCategoryCustomView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 12/03/22.
//

import UIKit

class SearchCategoryCustomView: UIView {

    // MARK: PROPERTIES -
    
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray.withAlphaComponent(0.1)
        return view
    }()
    
    lazy var categoryOptionsCollectionview: UICollectionView = {
        let collectionview = UICollectionView(frame: .zero , collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .clear
        
        collectionview.register(SearchCategoryCollectionViewCell.self, forCellWithReuseIdentifier: Key.ReusableIdentifiers.searchCategoryId)
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
        addSubview(categoryOptionsCollectionview)
    }
    
    func setUpConstraints(){
        categoryOptionsCollectionview.pin(to: self)
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

extension SearchCategoryCustomView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Key.ReusableIdentifiers.searchCategoryId, for: indexPath) as! SearchCategoryCollectionViewCell
        return cell
    }
    
}

extension SearchCategoryCustomView {
    
    func configureCompositionalLayout() {
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) in
                return LayoutType.horizontalDynamicLayout.getLayout()
        }
        
        categoryOptionsCollectionview.setCollectionViewLayout(layout, animated: true )
    }
    
}


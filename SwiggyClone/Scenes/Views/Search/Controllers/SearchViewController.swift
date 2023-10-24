//
//  SearchViewController.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/03/22.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: PROPERTIES -
    
    var dataToSearch: [SearchingContentListDataModel] = searchingContentMockData
    
    lazy var searchContainerView: SearchContainerView = {
        let view = SearchContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.delegate = self
        view.searchTextField.delegate = self
        return view
    }()
    
    lazy var searchedContentContainerView: SearchedContentContainerView = {
        let view = SearchedContentContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.isHidden = true
        view.delegate = self
        return view
    }()
    
    var searchDetailContainerView: SearchDetailContainerView = {
        let view = SearchDetailContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    // MARK: MAIN -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigations()
        setUpViews()
        setUpConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        view.addSubview(searchContainerView)
        view.addSubview(searchedContentContainerView)
        view.addSubview(searchDetailContainerView)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            searchContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchContainerView.heightAnchor.constraint(equalToConstant: 80),
            
            searchedContentContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            searchedContentContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchedContentContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchedContentContainerView.topAnchor.constraint(equalTo: searchContainerView.bottomAnchor),
            
            searchDetailContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            searchDetailContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchDetailContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchDetailContainerView.topAnchor.constraint(equalTo: searchContainerView.bottomAnchor),
            
        ])
    }

}

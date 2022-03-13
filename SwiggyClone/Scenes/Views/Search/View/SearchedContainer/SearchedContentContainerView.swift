//
//  SearchedContentContainerView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/03/22.
//

import UIKit

protocol SearchedContentActionDelegate {
    func didSearchSuggestionOptionSelected(with data: SearchingContentListDataModel)
}

class SearchedContentContainerView: UIView {

    // MARK: PROPERTIES -
    
    var searchedData: [SearchingContentListDataModel]? {
        didSet {
            seachedContentTableView.reloadData()
        }
    }
    var searchingFor: String?
    var delegate: SearchedContentActionDelegate?
    
    lazy var seachedContentTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchedContentTableViewCell.self, forCellReuseIdentifier: Key.ReusableIdentifiers.searchedContentId)
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        addSubview(seachedContentTableView)
    }
    
    func setUpConstraints(){
        seachedContentTableView.pin(to: self)
    }
    
}

extension SearchedContentContainerView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let searchedData = searchedData else { return Int() }
        if searchedData.count == 0 {
            return 1
        }
        return searchedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let searchedData = searchedData else {
            return UITableViewCell()
        }
        if searchedData.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Key.ReusableIdentifiers.searchedContentId, for: indexPath) as! SearchedContentTableViewCell
            cell.selectionStyle = .none
            cell.contentImageView.image = UIImage(named: "ic_search_default")
            cell.contentImageView.backgroundColor = .black
            cell.setAttributedTitle(title: "No Match found for \"\(searchingFor ?? "--")\"", subtitle: "" , searchFor: nil)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: Key.ReusableIdentifiers.searchedContentId, for: indexPath) as! SearchedContentTableViewCell
        cell.selectionStyle = .none
        let data = searchedData[indexPath.row]
        cell.setAttributedTitle(title: data.contentString.capitalized, subtitle: "\n\(data.searchCategory.capitalized)", searchFor: searchingFor ?? "")
        cell.data = data
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let searchedData = searchedData else {
            return
        }
        if searchedData.count != 0 {
            delegate?.didSearchSuggestionOptionSelected(with: searchedData[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

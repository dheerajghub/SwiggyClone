//
//  FilterCategoryView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 05/02/22.
//

import UIKit

protocol FilterCategoryActionDelegate {
    func didCategoryTapped(with index: Int)
}

class FilterCategoryView: UIView {

    // MARK: PROPERTIES -
    var categories: [String]? {
        didSet {
            tableView.reloadData()
            // Initially first cell should be active
            tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        }
    }
    
    var filterChangeData: FilterDataModel? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var delegate: FilterCategoryActionDelegate?
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(FilterCategoryTVCell.self, forCellReuseIdentifier: "FilterCategoryTVCell")
        tv.backgroundColor = .black.withAlphaComponent(0.07)
        tv.separatorColor = .gray.withAlphaComponent(0.5)
        tv.allowsMultipleSelection = false
        return tv
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
        addSubview(tableView)
    }
    
    func setUpConstraints(){
        tableView.pin(to: self)
    }

}

extension FilterCategoryView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCategoryTVCell", for: indexPath) as! FilterCategoryTVCell
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cell.cellLabel.text = categories?[indexPath.row]
        if let data = filterChangeData {
            cell.changeIndicator.isHidden = data.ischangesApplied ?  false : true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FilterCategoryTVCell
        cell.isSelected = true
        delegate?.didCategoryTapped(with: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FilterCategoryTVCell
        cell.isSelected = false
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let font = UIFont.customFont(ofType: .bold, withSize: 14)
        let width = UIScreen.main.bounds.width * 0.3
        let estimatedH = (categories?[indexPath.row].heightWithConstrainedWidth(width: (width - 40), font: font))! + 30 + 5
        if estimatedH > 60 {
            return estimatedH
        } else {
            return 60
        }
    }
    
}
 

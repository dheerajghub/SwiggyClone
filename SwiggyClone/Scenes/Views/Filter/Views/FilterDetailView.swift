//
//  FilterDetailView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 05/02/22.
//

import UIKit

protocol FilterDetailActionDelegate {
    func didOptionsTapped(data: FilterDataModel, sectionIndex: Int)
}

class FilterDetailView: UIView {

    // MARK: PROPERTIES -
    
    let cellId = "FilterDetailTableViewCell"
    var sectionIndex: Int = 0
    var delegate: FilterDetailActionDelegate?
    var lastIndexPath: IndexPath?
    
    var detailData: FilterDataModel? {
        didSet {
            guard let data = detailData else { return }
            tableView.allowsMultipleSelection = data.isMultiple ? true : false
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tv.separatorStyle = .none
        tv.sectionHeaderTopPadding = 0
        tv.register(FilterDetailTableViewCell.self, forCellReuseIdentifier: cellId)
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

extension FilterDetailView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailData?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60))
                
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = detailData?.category.uppercased()
        label.font = .customFont(ofType: .regular, withSize: 12)
        label.textColor = .black.withAlphaComponent(0.4)
        
        headerView.addSubview(label)
        headerView.backgroundColor = .white
        
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FilterDetailTableViewCell
        if let data = detailData {
            cell.data = data.options[indexPath.row]
            cell.isMultiple = data.isMultiple
            if data.options[indexPath.row].isSelected {
                cell.isSelected = true
                lastIndexPath = indexPath
            } else {
                cell.isSelected = false
            }
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = detailData else { return }
        let cell = tableView.cellForRow(at: indexPath) as! FilterDetailTableViewCell
        
        if data.isMultiple && data.options[indexPath.row].isSelected {
            cell.isSelected = false
            var dummy = data.options[indexPath.row]
            dummy.isSelected = false
            detailData?.options[indexPath.row] = dummy
        } else {
            cell.isSelected = true
            var dummy = data.options[indexPath.row]
            dummy.isSelected = true
            detailData?.options[indexPath.row] = dummy
            
            if !data.isMultiple && !data.options[indexPath.row].isSelected {
                if let lastIndexPath = lastIndexPath {
                    var dummy = data.options[lastIndexPath.row]
                    dummy.isSelected = false
                    detailData?.options[lastIndexPath.row] = dummy
                    tableView.deselectRow(at: lastIndexPath, animated: false)
                }
                self.lastIndexPath = indexPath
            }
        }
        
        // Update data globally
        delegate?.didOptionsTapped(data: detailData!, sectionIndex: sectionIndex)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let data = detailData else { return }
        let cell = tableView.cellForRow(at: indexPath) as! FilterDetailTableViewCell
        if !data.isMultiple {
            cell.isSelected = false
            
            var dummy = data.options[indexPath.row]
            dummy.isSelected = false
            detailData?.options[indexPath.row] = dummy
            
        } else {
            cell.isSelected = false
            
            var dummy = data.options[indexPath.row]
            dummy.isSelected = false
            detailData?.options[indexPath.row] = dummy
        }
        
        // Update data globally
        
        delegate?.didOptionsTapped(data: detailData!, sectionIndex: sectionIndex)
    }
    
}
 

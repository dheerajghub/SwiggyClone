//
//  FilterView.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 05/02/22.
//

import UIKit

protocol FilterViewActionDelegate {
    func didCloseBtnTapped()
}

class FilterView: UIView {

    // MARK: PROPERTIES -
    
    var delegate: FilterViewActionDelegate?
    let categories = ["Sort" , "Cuisines", "Offers & More"]
    var filterData = filterMockData
    var safeAreaBottomPadding: CGFloat = 0.0
    
    var applyViewHeightConstraint: NSLayoutConstraint?
    
    let headerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    let closeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(closeBtnPressed), for: .touchUpInside)
        btn.setImage(UIImage(named: "ic_close")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .black.withAlphaComponent(0.4)
        return btn
    }()
    
    let clearAllBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Clear All".uppercased(), for: .normal)
        btn.setTitleColor(Colors.appOrange, for: .normal)
        btn.titleLabel?.font = .customFont(ofType: .bold, withSize: 14)
        btn.isEnabled = false
        btn.alpha = 0.3
        btn.addTarget(self, action: #selector(clearAllBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    let headerTitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Sort / Filter"
        l.textColor = .black
        l.font = UIFont.customFont(ofType: .bold, withSize: 17)
        return l
    }()
    
    let dividerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .gray.withAlphaComponent(0.4)
        return v
    }()
    
    lazy var containerViewOne: FilterCategoryView = {
        let v = FilterCategoryView()
        v.delegate = self
        v.categories = categories
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var containerViewTwo: FilterDetailView = {
        let v = FilterDetailView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.delegate = self
        return v
    }()
    
    let applyView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    let applyDividerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .gray.withAlphaComponent(0.2)
        return v
    }()
    
    let applyBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Apply".uppercased(), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = Colors.appOrange
        btn.addTarget(self, action: #selector(applyBtnTapped), for: .touchUpInside)
        btn.titleLabel?.font = .customFont(ofType: .bold, withSize: 15)
        return btn
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
        
        // Initial Setup
        containerViewTwo.detailData = filterData[0]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if #available(iOS 11.0, *) {
                self.safeAreaBottomPadding = self.safeAreaInsets.bottom
            }
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        addSubview(headerView)
        headerView.addSubview(closeBtn)
        headerView.addSubview(headerTitle)
        headerView.addSubview(dividerView)
        headerView.addSubview(clearAllBtn)
        
        addSubview(containerViewOne)
        addSubview(containerViewTwo)
        
        addSubview(applyView)
        applyView.addSubview(applyDividerView)
        applyView.addSubview(applyBtn)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.7),
            
            closeBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            closeBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            closeBtn.widthAnchor.constraint(equalToConstant: 20),
            closeBtn.heightAnchor.constraint(equalToConstant: 20),
            
            clearAllBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            clearAllBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            headerTitle.leadingAnchor.constraint(equalTo: closeBtn.trailingAnchor, constant: 20),
            headerTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            containerViewOne.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            containerViewOne.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerViewOne.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3),
            
            containerViewTwo.leadingAnchor.constraint(equalTo: containerViewOne.trailingAnchor),
            containerViewTwo.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            containerViewTwo.bottomAnchor.constraint(equalTo: applyView.topAnchor),
            containerViewTwo.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            applyView.leadingAnchor.constraint(equalTo: containerViewOne.trailingAnchor),
            applyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            applyView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            applyDividerView.topAnchor.constraint(equalTo: applyView.topAnchor),
            applyDividerView.leadingAnchor.constraint(equalTo: applyView.leadingAnchor),
            applyDividerView.trailingAnchor.constraint(equalTo: applyView.trailingAnchor),
            applyDividerView.heightAnchor.constraint(equalToConstant: 0.7),
            
            applyBtn.leadingAnchor.constraint(equalTo: applyView.leadingAnchor, constant: 20),
            applyBtn.trailingAnchor.constraint(equalTo: applyView.trailingAnchor, constant: -20),
            applyBtn.topAnchor.constraint(equalTo: applyView.topAnchor, constant: 20),
            applyBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        applyViewHeightConstraint = applyView.heightAnchor.constraint(equalToConstant: 0)
        applyViewHeightConstraint?.isActive = true
    }
    
    // MARK: - ACTIONS
    
    @objc func closeBtnPressed(){
        delegate?.didCloseBtnTapped()
    }
    
    @objc func clearAllBtnPressed(){
        filterData = filterMockData
        containerViewOne.tableView.reloadData()
        containerViewOne.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        containerViewTwo.detailData = filterData[0]
        
        clearAllBtn.isEnabled = false
        clearAllBtn.alpha = 0.3
        
        self.applyViewHeightConstraint?.constant = 0
        UIView.animate(withDuration: 0.1) {
            self.layoutIfNeeded()
        }
        
    }
    
    @objc func applyBtnTapped(){
        print("Apply Btn Tapped")
    }

}

extension FilterView: FilterCategoryActionDelegate, FilterDetailActionDelegate  {
    
    func didOptionsTapped(data: FilterDataModel, sectionIndex: Int) {
        filterData[sectionIndex] = data
        
        clearAllBtn.isEnabled = true
        clearAllBtn.alpha = 1
        
        if applyViewHeightConstraint?.constant == 0 {
            self.applyViewHeightConstraint?.constant = self.safeAreaBottomPadding + 70
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }
    }
    
    func didCategoryTapped(with index: Int) {
        containerViewTwo.detailData = filterData[index]
        containerViewTwo.sectionIndex = index
        containerViewTwo.lastIndexPath = nil
    }
    
    
}

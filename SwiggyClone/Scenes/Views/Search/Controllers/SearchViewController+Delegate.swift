//
//  SearchViewController+Delegate.swift
//  SwiggyClone
//
//  Created by Dheeraj Kumar Sharma on 06/03/22.
//

import Foundation

extension SearchViewController: SearchContainerViewActionDelegate, SearchedContentActionDelegate {
    
    func didSearchSuggestionOptionSelected(with data: SearchingContentListDataModel) {
        print(data)
        searchDetailContainerView.isHidden = false
        searchContainerView.searchTextFieldLeadingAnchor?.constant = 45
        searchContainerView.backButton.isHidden = false
        searchContainerView.searchTextField.text = data.contentString.capitalized
        searchContainerView.searchTextField.endEditing(true)
    }
    
    func didCloseTapped() {
        searchedContentContainerView.isHidden = true
        searchContainerView.searchTextField.text = ""
        searchContainerView.closeButton.isHidden = true
    }
    
    func didBackButtonTapped(){
        searchedContentContainerView.isHidden = true
        searchDetailContainerView.isHidden = true
        
        searchContainerView.backButton.isHidden = true
        searchContainerView.closeButton.isHidden = true
        searchContainerView.searchTextFieldLeadingAnchor?.constant = 15
        searchContainerView.searchTextField.text = ""
        searchContainerView.searchTextField.endEditing(true)
    }
    
    func didSearchTextFieldChanged(with text: String) {
        if text != "" {
            searchedContentContainerView.searchingFor = text
            searchedContentContainerView.isHidden = false
            var searchedData:[SearchingContentListDataModel] = []
            searchedData = dataToSearch.filter({ searchData in
                return searchData.contentString.lowercased().contains(text.lowercased())
            })
            searchedContentContainerView.searchedData = searchedData
        } else {
            searchedContentContainerView.isHidden = true
            searchedContentContainerView.searchingFor = nil
        }
    }
    
}

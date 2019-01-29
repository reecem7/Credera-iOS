//
//  SearchQueryViewModel.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 1/28/19.
//  Copyright © 2019 Credera. All rights reserved.
//

class SearchQueryViewModel {
    public var searchQuery: String
    
    init(searchQuery: String?) {
        self.searchQuery = searchQuery ?? ""
    }
}

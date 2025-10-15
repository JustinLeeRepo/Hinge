//
//  SelectableListViewModel.swift
//  
//
//  Created by Justin Lee on 10/14/25.
//

import SwiftUI

@Observable
public class SelectableListViewModel {
    enum State {
        case success([String])
    }
    
    var state: State {
        return .success(cellViewModels)
    }
    
    private var cellViewModels: [String] = ["YEAH", "YAHOO", "ACHOO"]
    
    public init() {
        
    }
}

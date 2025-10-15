//
//  RootCoordinator.swift
//  Hinge
//
//  Created by Justin Lee on 10/14/25.
//

import Foundation
import SharedUI

@Observable 
class RootCoordinator {
    enum State {
        case authorized
    }
    
    var state: State {
        return .authorized
    }
    
    let listViewModel: SelectableListViewModel
    
    init() {
        self.listViewModel = SelectableListViewModel()
    }
}

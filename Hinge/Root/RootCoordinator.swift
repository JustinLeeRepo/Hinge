//
//  RootCoordinator.swift
//  Hinge
//
//  Created by Justin Lee on 10/14/25.
//

import Foundation
import Domain
import VerticalList

@Observable 
class RootCoordinator {
    enum State {
        case authorized
    }
    
    var state: State {
        return .authorized
    }
    
    let listViewModel: VerticalListViewModel<Pronoun>
    
    init() {
        self.listViewModel = VerticalListViewModel(models: Pronoun.testGroup1)
    }
}

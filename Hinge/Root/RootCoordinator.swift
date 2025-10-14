//
//  RootCoordinator.swift
//  Hinge
//
//  Created by Justin Lee on 10/14/25.
//

import Foundation
import Combine

@Observable class RootCoordinator {
    enum State {
        case authorized
    }
    
    var state: State {
        return .authorized
    }
    
    init() {
        
    }
}

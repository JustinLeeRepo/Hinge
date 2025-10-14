//
//  RootCoordinatorView.swift
//  Hinge
//
//  Created by Justin Lee on 10/14/25.
//

import SwiftUI

struct RootCoordinatorView: View {
    var coordinator: RootCoordinator
    
    var body: some View {
        switch coordinator.state {
            
        case .authorized:
            Text("Yeah")
        }
    }
}

#Preview {
    RootCoordinatorView(coordinator: RootCoordinator())
}

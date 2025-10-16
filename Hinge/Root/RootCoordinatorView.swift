//
//  RootCoordinatorView.swift
//  Hinge
//
//  Created by Justin Lee on 10/14/25.
//

import SwiftUI
import VerticalList

struct RootCoordinatorView: View {
    var coordinator: RootCoordinator
    
    var body: some View {
        switch coordinator.state {
            
        case .authorized:
            VerticalListView(viewModel: coordinator.listViewModel)
        }
    }
}

#Preview {
    RootCoordinatorView(coordinator: RootCoordinator())
}

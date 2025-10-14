//
//  HingeApp.swift
//  Hinge
//
//  Created by Justin Lee on 10/14/25.
//

import SwiftUI

@main
struct HingeApp: App {
    @State private var coordinator = RootCoordinator()
    
    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(coordinator: coordinator)
        }
    }
}

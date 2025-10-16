//
//  VerticalListView.swift
//
//
//  Created by Justin Lee on 10/15/25.
//

import Domain
import SharedUI
import SwiftUI

public struct VerticalListView<Model: SelectableModel>: View {
    var viewModel: VerticalListViewModel<Model>
    
    public init(viewModel: VerticalListViewModel<Model>) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(spacing: 12) {
            HorizontalSelectionView(viewModel: viewModel.selectionViewModel)
                .frame(minHeight: 45, maxHeight: 100)
            
            SelectableListView(viewModel: viewModel.listViewModel)
        }
    }
}

#Preview {
    VerticalListView(viewModel: VerticalListViewModel(models: Pronoun.testGroup1))
}

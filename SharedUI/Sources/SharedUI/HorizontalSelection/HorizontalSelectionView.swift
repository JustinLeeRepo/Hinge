//
//  HorizontalSelectionView.swift
//
//
//  Created by Justin Lee on 10/15/25.
//

import Domain
import Combine
import SwiftUI

public struct HorizontalSelectionView<Model: SelectableModel>: View {
    let viewModel: HorizontalSelectionViewModel<Model>
    
    public init(viewModel: HorizontalSelectionViewModel<Model>) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.selectionCellViewModels) { viewModel in
                    HorizontalSelectionCell(viewModel: viewModel)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}

#Preview {
    HorizontalSelectionView<MockSelectableModel>(viewModel: HorizontalSelectionViewModel(rowEventPublisher: PassthroughSubject()))
}

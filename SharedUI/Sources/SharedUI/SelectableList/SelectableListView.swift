//
//  SelectableListView.swift
//
//
//  Created by Justin Lee on 10/14/25.
//

import Combine
import Domain
import SwiftUI

public struct SelectableListView<Model: SelectableModel>: View {
    var viewModel: SelectableListViewModel<Model>
    
    public init(viewModel: SelectableListViewModel<Model>) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        switch viewModel.state {
        case let .success(rowViewModels):
            generateList(viewModels: rowViewModels)
        }
    }
    
    private func generateList(viewModels: [SelectableRowViewModel<Model>]) -> some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModels) { viewModel in
                    SelectableRowView(viewModel: viewModel)
                    
                    Divider()
                        .padding(.horizontal)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    let subject = PassthroughSubject<SelectableRowViewModel<MockSelectableModel>.RowEvent, Never>()
    return SelectableListView(viewModel: SelectableListViewModel(models: MockSelectableModel.testGroup1, rowEventPublisher: subject))
}

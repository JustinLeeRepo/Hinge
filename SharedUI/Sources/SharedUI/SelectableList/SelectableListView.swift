//
//  SelectableListView.swift
//
//
//  Created by Justin Lee on 10/14/25.
//

import SwiftUI

public struct SelectableListView: View {
    @Bindable var viewModel: SelectableListViewModel
    
    public init(viewModel: SelectableListViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        switch viewModel.state {
        case let .success(rowViewModels):
            generateList(viewModels: rowViewModels)
        }
    }
    
    private func generateList(viewModels: [SelectableRowViewModel]) -> some View {
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
    SelectableListView(viewModel: SelectableListViewModel())
}

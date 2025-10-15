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
        case let .success(titles):
            generateList(titles: titles)
        }
    }
    
    private func generateList(titles: [String]) -> some View {
        ScrollView {
            LazyVStack {
                ForEach(titles, id: \.self) { title in
                    Button {
                        print("YEAH")
//                        viewModel.selectCell()
                    } label: {
                        HStack {
                            Text(title)
                            Spacer()
                            Text("Circle w state")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SelectableListView(viewModel: SelectableListViewModel())
}

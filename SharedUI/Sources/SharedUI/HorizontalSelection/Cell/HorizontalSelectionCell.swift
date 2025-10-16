//
//  SwiftUIView.swift
//  
//
//  Created by Justin Lee on 10/15/25.
//

import SwiftUI
import Domain

struct HorizontalSelectionCell<Model: SelectableModel>: View {
    
    var viewModel: HorizontalSelectionCellViewModel<Model>
    
    var body: some View {
        HStack {
            Text(viewModel.title)
            
            Button {
                viewModel.removeSelection()
            } label: {
                Label("Remove", systemImage: "xmark")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(.capsule)
    }
}

#Preview {
    let model = MockSelectableModel(id: 2, title: "YESS")
    return HorizontalSelectionCell(viewModel: HorizontalSelectionCellViewModel(selection: model, onRemoval: {}))
}

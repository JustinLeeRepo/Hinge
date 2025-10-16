//
//  SelectableRowView.swift
//
//
//  Created by Justin Lee on 10/14/25.
//

import SwiftUI
import Domain
import Combine

struct SelectableRowView: View {
    var viewModel: SelectableRowViewModel
    
    var body: some View {
        Button {
            viewModel.selectRow()
        } label: {
            VStack {
                HStack {
                    Text(viewModel.title)
                    
                    Spacer()
                    
                    Circle()
                        .fill(viewModel.isSelected ? .black : .gray)
                        .frame(width: 25)
                }
                .contentShape(.rect)
            }
        }
        .padding()
        .buttonStyle(.plain)
    }
}

#Preview {
    let model = MockSelectableModel(id: 9, title: "YES")
    let publisher = PassthroughSubject<RowEvent, Never>()
    return SelectableRowView(viewModel: SelectableRowViewModel(model: model, rowEventPublisher: publisher))
}

//
//  SelectableRowViewModel.swift
//
//
//  Created by Justin Lee on 10/14/25.
//

import Combine
import Domain
import SwiftUI


@Observable
public class SelectableRowViewModel<Model: SelectableModel> {
    public enum RowEvent {
        case selectRow(SelectableRowViewModel, () -> Void)
        case deselectRow(SelectableRowViewModel)
    }
    
    enum State {
        case selected
        case unselected
    }
    
    var state: State {
        if isSelected {
            return .selected
        }
        
        return .unselected
    }
    
    var title: String {
        model.title
    }
    
    let model: Model
    
    private(set) var isSelected: Bool
    private var rowEventPublisher: PassthroughSubject<RowEvent, Never>
    
    public init(model: Model, rowEventPublisher: PassthroughSubject<RowEvent, Never>, isSelected: Bool = false) {
        self.model = model
        self.isSelected = isSelected
        self.rowEventPublisher = rowEventPublisher
    }
    
    func selectRow() {
        withAnimation {
            isSelected.toggle()
        }
        
        if isSelected {
            rowEventPublisher.send(.selectRow(self, deselctRow))
        }
        else {
            rowEventPublisher.send(.deselectRow(self))
        }
    }
    
    private func deselctRow() {
        withAnimation {
            isSelected.toggle()
        }
        
        rowEventPublisher.send(.deselectRow(self))
    }
}

extension SelectableRowViewModel: Identifiable {
    public var id: Int {
        model.id
    }
}

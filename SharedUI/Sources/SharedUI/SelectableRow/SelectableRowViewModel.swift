//
//  SelectableRowViewModel.swift
//
//
//  Created by Justin Lee on 10/14/25.
//

import Combine
import Domain
import SwiftUI

public enum RowEvent {
    case selectRow(SelectableRowViewModel)
}

@Observable
public class SelectableRowViewModel {
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
    
    let model: any SelectableModel
    
    private(set) var isSelected: Bool
    private var rowEventPublisher: PassthroughSubject<RowEvent, Never>
    
    public init(model: any SelectableModel, rowEventPublisher: PassthroughSubject<RowEvent, Never>, isSelected: Bool = false) {
        self.model = model
        self.isSelected = isSelected
        self.rowEventPublisher = rowEventPublisher
    }
    
    func selectRow() {
        withAnimation {
            isSelected.toggle()
        }
        rowEventPublisher.send(.selectRow(self))
    }
}

extension SelectableRowViewModel: Identifiable {
    public var id: Int {
        model.id
    }
}

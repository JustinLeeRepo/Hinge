//
//  HorizontalSelectionViewModel.swift
//
//
//  Created by Justin Lee on 10/15/25.
//

import Combine
import Domain
import Foundation
import SwiftUI

@Observable
public class HorizontalSelectionViewModel<Model: SelectableModel> {
    public typealias RowEvent = SelectableRowViewModel<Model>.RowEvent
    
    var selectionCellViewModels: [HorizontalSelectionCellViewModel<Model>] = []
    
    private var rowEventPublisher: PassthroughSubject<RowEvent, Never>
    private var cancellables = Set<AnyCancellable>()
    
    public init(rowEventPublisher: PassthroughSubject<RowEvent, Never>) {
        self.rowEventPublisher = rowEventPublisher
        setupListener()
    }
    
    private func setupListener() {
        rowEventPublisher.sink { [weak self] event in
            self?.handleEvent(event)
        }
        .store(in: &cancellables)
    }
    
    private func handleEvent(_ event: RowEvent) {
        switch event {
        case .selectRow(let rowViewModel, let onRemoval):
            let selectionCellViewModel = HorizontalSelectionCellViewModel(selection: rowViewModel.model, onRemoval: onRemoval)
            withAnimation {
                selectionCellViewModels.append(selectionCellViewModel)
            }
            
            break
            
        case .deselectRow(let rowViewModel):
            withAnimation {
                selectionCellViewModels.removeAll { $0.selection == rowViewModel.model }
            }
            
            break
        }
    }
}

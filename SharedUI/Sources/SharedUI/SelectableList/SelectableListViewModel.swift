//
//  SelectableListViewModel.swift
//  
//
//  Created by Justin Lee on 10/14/25.
//

import SwiftUI
import Combine
import Domain

@Observable
public class SelectableListViewModel<Model: SelectableModel> {
    public typealias RowEvent = SelectableRowViewModel<Model>.RowEvent
    enum State {
        case success([SelectableRowViewModel<Model>])
    }
    
    var state: State {
        return .success(cellViewModels)
    }
    
    private let models: [Model]
    private var cellViewModels: [SelectableRowViewModel<Model>] = []
    private let rowEventPublisher: PassthroughSubject<RowEvent, Never>
    
    public init(models: [Model], rowEventPublisher: PassthroughSubject<RowEvent, Never>) {
        self.models = models
        self.rowEventPublisher = rowEventPublisher
        
        Task {
            fetchViewModels()
        }
    }
    
    func fetchViewModels() {
        withAnimation {
            cellViewModels = models.map({ model in
                SelectableRowViewModel(model: model, rowEventPublisher: rowEventPublisher)
            })
        }
    }
}

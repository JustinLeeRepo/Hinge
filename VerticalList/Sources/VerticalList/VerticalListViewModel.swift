//
//  File.swift
//  
//
//  Created by Justin Lee on 10/15/25.
//

import Combine
import Domain
import Foundation
import SharedUI

@Observable
public class VerticalListViewModel<Model: SelectableModel> {
    
    typealias RowEvent = SelectableRowViewModel<Model>.RowEvent
    let listViewModel: SelectableListViewModel<Model>
    let selectionViewModel: HorizontalSelectionViewModel<Model>
    
    private var rowEventPublisher: PassthroughSubject<RowEvent, Never>
    
    public init(models: [Model]) {
        let rowEventPublisher = PassthroughSubject<RowEvent, Never>()
        
        self.listViewModel = SelectableListViewModel(models: models, rowEventPublisher: rowEventPublisher)
        self.selectionViewModel = HorizontalSelectionViewModel(rowEventPublisher: rowEventPublisher)
        
        self.rowEventPublisher = rowEventPublisher
    }
}

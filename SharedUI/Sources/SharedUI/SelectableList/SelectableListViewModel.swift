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
public class SelectableListViewModel {
    enum State {
        case success([SelectableRowViewModel])
    }
    
    var state: State {
        return .success(cellViewModels)
    }
    
    private var cellViewModels: [SelectableRowViewModel] = []
    private let rowEventPublisher: PassthroughSubject<RowEvent, Never>
    
    public init() {
        rowEventPublisher = PassthroughSubject<RowEvent, Never>()
        Task {
            fetchViewModels()
        }
    }
    
    func fetchViewModels() {
        withAnimation {
            cellViewModels = Pronoun.testGroup1.map({ pronoun in
                SelectableRowViewModel(model: pronoun, rowEventPublisher: rowEventPublisher)
            })
        }
    }
}

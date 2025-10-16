//
//  File.swift
//  
//
//  Created by Justin Lee on 10/15/25.
//

import Foundation
import Domain

@Observable
class HorizontalSelectionCellViewModel<Model: SelectableModel>: Identifiable {
    typealias OnRemovalCallback = () -> Void
    var selection: Model
    
    var id: Int {
        selection.id
    }
    
    var title: String {
        selection.title
    }
    
    private let onRemoval: OnRemovalCallback
    
    init(selection: Model, onRemoval: @escaping OnRemovalCallback) {
        self.selection = selection
        self.onRemoval = onRemoval
    }
    
    func removeSelection() {
        onRemoval()
    }
}

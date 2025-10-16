//
//  SelectableModel.swift
//
//
//  Created by Justin Lee on 10/15/25.
//

import Foundation

public protocol SelectableModel: Codable, Identifiable, Equatable {
    var id: Int { get }
    var title: String { get }
}

public struct MockSelectableModel: SelectableModel {
    public let id: Int
    public let title: String
    
    public init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

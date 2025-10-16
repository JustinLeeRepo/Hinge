//
//  SelectableModel.swift
//
//
//  Created by Justin Lee on 10/15/25.
//

import Foundation

public protocol SelectableModel: Codable, Identifiable, Hashable, Equatable {
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

extension MockSelectableModel {
    public static var testGroup1: [MockSelectableModel] {
        [
            MockSelectableModel(id: 0, title: "Yo"),
            MockSelectableModel(id: 1, title: "Ao"),
            MockSelectableModel(id: 2, title: "Bo"),
            MockSelectableModel(id: 3, title: "Co"),
            MockSelectableModel(id: 4, title: "Do"),
            MockSelectableModel(id: 5, title: "Eo"),
            MockSelectableModel(id: 6, title: "Fo"),
            MockSelectableModel(id: 7, title: "Go"),
            MockSelectableModel(id: 8, title: "Ho"),
            MockSelectableModel(id: 9, title: "Io"),
            MockSelectableModel(id: 10, title: "Jo"),
            MockSelectableModel(id: 11, title: "Ko"),
            MockSelectableModel(id: 12, title: "Lo"),
            MockSelectableModel(id: 13, title: "Mo")
        ]
    }
}

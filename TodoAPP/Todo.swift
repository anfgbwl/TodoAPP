//
//  Todo.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/08/30.
//

import Foundation

struct Todo: Codable {
    var todo: String
    var isCompleted: Bool
}

extension Todo: Equatable {
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.todo == rhs.todo
    }
}

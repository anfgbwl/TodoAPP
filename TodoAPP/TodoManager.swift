//
//  TodoManager.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/08/31.
//

import Foundation

struct TodoManager {
    static let userDefaults = UserDefaults.standard
    
    // MARK: - Variables
    static var todoList: [Todo] = [
        Todo(todo: "킬링보이스 악뮤 보기", isCompleted: true),
        Todo(todo: "개인 과제 코드로만 해보기", isCompleted: false)
    ]
    
    // MARK: - Load
    static func loadTodo() {
        if let data = userDefaults.data(forKey: "todoList"),
           let loadTodoList = try? JSONDecoder().decode([Todo].self, from: data) {
            todoList = loadTodoList
        }
        
        /*
        if let todo = userDefaults.string(forKey: "todoTitle"),
           let isCompleted = userDefaults.bool(forKey: "isCompleted") {
         // ERROR: Initializer for conditional binding must have Optional type, not 'Bool' -> userDefaults.bool(forKey:) 메서드는 Bool 값을 반환하며, 이 값은 옵셔널이 아님. 따라서 조건부 바인딩으로 추출하려고 하면 오류 발생
            let loadTodoList = Todo(todo: todo, isCompleted: isCompleted)
        }
        */
        
    }
    
    // MARK: - Add
    static func addTodo(_ newTodo: Todo) {
        var updatedTodoList = todoList
        updatedTodoList.append(newTodo)
        todoList = updatedTodoList
        saveTodo(newTodo)
        loadTodo()
        
        /*
        userDefaults.set(newTodo.todo, forKey: "todoTitle")
        userDefaults.set(newTodo.isCompleted, forKey: "isCompleted")
        개별로 저장할 수 있으나, 나중에 todoList를 load 할 때 이 데이터들을 다시 불러와서 Todo 객체로 조합해야 함. 분리된 저장 방식은 데이터를 관리하거나 활용하기에 복잡함 -> Codable 프로토콜을 사용하여 객체를 한 번에 저장하고 로드하는 것이 더 효율적
        */
        /*
        userDefaults.set(todoList, forKey: "todoList") // ERROR: Attempt to insert non-property list object -> UserDefaults는 기본 데이터 형식(property list)만 저장할 수 있음. Array나 Dictionary와 같은 복잡한 데이터 구조를 직접 저장하지 못함 -> Codable 프로토콜을 활용하여 데이터를 인코딩 및 디코딩해야 함
        */
        print(todoList)
    }
    
    // MARK: - Save
    static func saveTodo(_ saveTodo: Todo) {
        if let saveData = try? JSONEncoder().encode(todoList) {
            userDefaults.set(saveData, forKey: "todoList")
        }
        
    }
    
    // MARK: - Delete
    
}

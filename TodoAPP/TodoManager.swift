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
    
    static var completedTodoList: [Todo] = []
    
    // MARK: - Load
    static func loadTodo() {
        if let data = userDefaults.data(forKey: "todoList"),
           let loadTodoList = try? JSONDecoder().decode([Todo].self, from: data) {
            todoList = loadTodoList
        }
    }
    
    // MARK: - CompletedLoad
    static func loadCompletedTodo() {
        completedTodoList = todoList.filter { $0.isCompleted == true }
    }
    
    // MARK: - Add
    static func addTodo(_ newTodo: Todo) {
        var updatedTodoList = todoList
        updatedTodoList.append(newTodo)
        todoList = updatedTodoList
        saveTodo()
        loadTodo()
        print("todoList: ", todoList)
    }
    
    // MARK: - Edit
    static func editTodo(editTodoIndex: Int, editTodo: Todo) {
        guard editTodoIndex >= 0 && editTodoIndex < todoList.count else { return }
        todoList.remove(at: editTodoIndex)
        todoList.insert(editTodo, at: editTodoIndex)
        saveTodo()
    }
    
    // MARK: - Save
    static func saveTodo() {
        if let saveData = try? JSONEncoder().encode(todoList) {
            userDefaults.set(saveData, forKey: "todoList")
        }
    }
    
    // MARK: - Delete
    static func deleteTodo(_ deleteTodoIndex: Int) {
        guard deleteTodoIndex >= 0 && deleteTodoIndex < todoList.count else { return }
        todoList.remove(at: deleteTodoIndex)
        saveTodo()
    }
    
}

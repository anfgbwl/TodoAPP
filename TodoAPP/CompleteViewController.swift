//
//  CompleteViewController.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/09/01.
//

import UIKit

class CompleteViewController: UIViewController {
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TodoManager.loadCompletedTodo()
    }
    
    // MARK: - setupUI
    private func setupUI() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }

}

extension CompleteViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - NORMAL CELL
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.completedTodoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemBackground
        cell.textLabel?.text = TodoManager.completedTodoList[indexPath.row].todo
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let selectCompletedTodo = TodoManager.completedTodoList[indexPath.row]
            let deleteCompletedTodoIndex = TodoManager.todoList.firstIndex { $0 == selectCompletedTodo } ?? 0
            TodoManager.completedTodoList.remove(at: indexPath.row)
            TodoManager.deleteTodo(deleteCompletedTodoIndex)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
}

//
//  ViewController.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/08/30.
//

import UIKit

class TodoViewController: UIViewController {
    
    // MARK: - UI Conponents
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.allowsSelection = false
        return tableView
    }()
    
    private let addButton: UIBarButtonItem = {
        let addButton = UIBarButtonItem()
        addButton.title = "Add"
        /*
        여기 넣으면 오류: Type of expression is ambiguous without more context
        addButton.target = self
        addButton.action = #selector(didTapAddButton)
        */
        return addButton
    }()
    
    
    // MARK: - AddButton Action
    @objc private func didTapAddButton() {
        let todoAddAlert = UIAlertController(title: "Add Todo", message: "", preferredStyle: .alert)
        todoAddAlert.addTextField { (textField) in
            textField.placeholder = "Please write your todo."
        }
        let add = UIAlertAction(title: "Add", style: .default) { (_) in
            if let title = todoAddAlert.textFields?[0].text, title != "" {
                TodoManager.addTodo(Todo(todo: title, isCompleted: false))
                self.tableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        todoAddAlert.addAction(add)
        todoAddAlert.addAction(cancel)
        present(todoAddAlert, animated: false)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        TodoManager.loadTodo()
        setupUI()
        addButton.target = self
        addButton.action = #selector(didTapAddButton)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - setupUI
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(tableView)
        self.navigationItem.rightBarButtonItem = self.addButton
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }

}

extension TodoViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - NORMAL CELL
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("Error")
        }
        cell.backgroundColor = .systemBackground
        let target = TodoManager.todoList[indexPath.row]
        cell.configure(with: target.todo, and: target.isCompleted)
        if cell.todoSwitch.isOn {
            cell.todoLabel.textColor = .systemGray
            cell.todoLabel.attributedText = cell.todoLabel.text?.strikeThrough()
        } else {
            cell.todoLabel.attributedText = cell.todoLabel.text?.removestrikeThrough()
            cell.todoLabel.textColor = .label
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}



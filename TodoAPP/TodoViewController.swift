//
//  ViewController.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/08/30.
//

import UIKit

class TodoViewController: UIViewController {
    
    // MARK: - Variables
    private var todoList: [Todo] = [
        Todo(todo: "킬링보이스 악뮤 보기", isCompleted: true),
        Todo(todo: "개인 과제 코드로만 해보기", isCompleted: false)
    ]
    
    // MARK: - UI Conponents
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.allowsSelection = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - setupUI
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
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

extension TodoViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - NORMAL CELL
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("Error")
        }
        cell.backgroundColor = .systemBackground
        let target = self.todoList[indexPath.row]
        cell.configure(with: target.todo, and: target.isCompleted)
        if cell.todoSwitch.isOn {
            cell.todoLabel.attributedText = cell.todoLabel.text?.removestrikeThrough()
            cell.todoLabel.textColor = .label
        } else {
            cell.todoLabel.textColor = .systemGray
            cell.todoLabel.attributedText = cell.todoLabel.text?.strikeThrough()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}



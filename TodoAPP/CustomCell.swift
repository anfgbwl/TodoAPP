//
//  CustomCell.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/08/30.
//

import UIKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    // MARK: - UI Components
    var todoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    var todoSwitch: UISwitch = {
        let todoSwitch = UISwitch()
        todoSwitch.isOn = true
        todoSwitch.onTintColor = .tintColor
        todoSwitch.addTarget(self, action: #selector(didTapSwitch(sender:)), for: .valueChanged) // self만 하면 경고창이 뜨는데 'self' refers to the method 'CustomCell.self', which may be unexpected -> CustomCell.self 하면 에러뜸
        return todoSwitch
    }()
    
    @objc func didTapSwitch(sender: UISwitch) {
        if sender.isOn {
            todoLabel.textColor = .systemGray
            todoLabel.attributedText = todoLabel.text?.strikeThrough()
        } else {
            todoLabel.attributedText = nil
        }
        guard let tableView = superview as? UITableView,
              let indexPath = tableView.indexPath(for: self) else { return }
        var editTodo = TodoManager.todoList[indexPath.row]
        editTodo.isCompleted = sender.isOn
        TodoManager.editTodo(editTodoIndex: indexPath.row, editTodo: editTodo)
        tableView.reloadData()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with label: String, and mySwitch: Bool) {
        todoLabel.text = label
        todoSwitch.isOn = mySwitch
    }
    
    // MARK: - setupUI
    private func setupUI() {
        self.contentView.addSubview(todoLabel)
        self.contentView.addSubview(todoSwitch)
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        todoSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todoLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            todoLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            todoLabel.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            
            todoSwitch.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            todoSwitch.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            todoSwitch.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
}

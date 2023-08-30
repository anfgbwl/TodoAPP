//
//  CustomCell.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/08/30.
//

import UIKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    private let todoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with label: String) {
        self.todoLabel.text = label
    }
    
    private func setupUI() {
        self.contentView.addSubview(todoLabel)
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todoLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            todoLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            todoLabel.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            todoLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
        
    }
    
}

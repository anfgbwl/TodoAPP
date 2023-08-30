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
        todoSwitch.addTarget(self, action: #selector(didTapSwitch(sender:)), for: .valueChanged)
        return todoSwitch
    }()
    
    @objc func didTapSwitch(sender: UISwitch) {
        if sender.isOn {
            todoLabel.attributedText = todoLabel.text?.removestrikeThrough()
            todoLabel.textColor = .label
        } else {
            todoLabel.textColor = .systemGray
            todoLabel.attributedText = todoLabel.text?.strikeThrough()
        }
        // 스위치 누르면 작동할 코드
        // 스위치가 false이면 label에 취소선 긋기(extension 활용)
        // todo 업데이트
        
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

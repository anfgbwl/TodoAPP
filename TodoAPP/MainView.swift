//
//  MainView.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/08/30.
//

import UIKit

class MainView: UIView {

    static let identifier = "MainView"
    
    // MARK: - UI Components
    private let mainImage: UIImageView = {
        let mainIv = UIImageView()
        mainIv.contentMode = .scaleAspectFit
        mainIv.image = UIImage(named: "mainImage")
        return mainIv
    }()
    
    private let todoButton: UIButton = {
        let todoButton = UIButton()
        todoButton.setTitle("Todo List", for: .normal)
        todoButton.backgroundColor = .tintColor
        todoButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        todoButton.layer.cornerRadius = 10
        return todoButton
    }()
    
    private let completedButton: UIButton = {
        let completedButton = UIButton()
        completedButton.setTitle("Complete List", for: .normal)
        completedButton.backgroundColor = .systemGray
        completedButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        completedButton.layer.cornerRadius = 10
        return completedButton
    }()
    
    // MARK: - setupUI
    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.addSubview(mainImage)
        self.addSubview(todoButton)
        self.addSubview(completedButton)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        todoButton.translatesAutoresizingMaskIntoConstraints = false
        completedButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            mainImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 300),
            mainImage.heightAnchor.constraint(equalToConstant: 250),
            
            todoButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 50),
            todoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            todoButton.widthAnchor.constraint(equalToConstant: 150),
            todoButton.heightAnchor.constraint(equalToConstant: 50),
            
            completedButton.topAnchor.constraint(equalTo: todoButton.bottomAnchor, constant: 50),
            completedButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            completedButton.widthAnchor.constraint(equalToConstant: 150),
            completedButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}

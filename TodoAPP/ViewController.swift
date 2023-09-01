//
//  ViewController.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/08/30.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Conponents
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
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(mainImage)
        self.view.addSubview(todoButton)
        self.view.addSubview(completedButton)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        todoButton.translatesAutoresizingMaskIntoConstraints = false
        completedButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 300),
            mainImage.heightAnchor.constraint(equalToConstant: 250),
            
            todoButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 50),
            todoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoButton.widthAnchor.constraint(equalToConstant: 150),
            todoButton.heightAnchor.constraint(equalToConstant: 50),
            
            completedButton.topAnchor.constraint(equalTo: todoButton.bottomAnchor, constant: 50),
            completedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completedButton.widthAnchor.constraint(equalToConstant: 150),
            completedButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        todoButton.addTarget(self, action: #selector(seletedTodoButton), for: .touchUpInside)
    }
    
    // MARK: - Button Action
    @objc private func seletedTodoButton() {
        let TodoVC = TodoViewController()
        self.navigationController?.pushViewController(TodoVC, animated: true)
    }
    
}

//
//  ViewController.swift
//  TodoAPP
//
//  Created by t2023-m0076 on 2023/08/30.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Conponents
    private let mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = .systemBackground
        return mainView
    }()
    
    // MARK: - setupUI
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
}

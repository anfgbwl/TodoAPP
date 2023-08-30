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

    
    
}

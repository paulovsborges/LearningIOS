//
//  ViewController.swift
//  locktap-uikit
//
//  Created by Borges on 10/06/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MyColors.blue101727
        
        setupAppLogo()
    }
    
    private func setupAppLogo(){
        
        let imageView = UIImageView(image: UIImage(named: "locktap_splash_logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


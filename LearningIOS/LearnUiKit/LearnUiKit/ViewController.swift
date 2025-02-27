//
//  ViewController.swift
//  LearnUiKit
//
//  Created by Borges on 31/01/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = .blue
        
        view.addSubview(    label)
        
        NSLayoutConstraint.activate(  [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo:view.centerYAnchor
                                          ),
        ]  )
        
    }
}


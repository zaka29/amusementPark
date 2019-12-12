//
//  PassPageController.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 5/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import UIKit

class PassPageController: UIViewController {
    var pass: Pass?
   
    let createNewPassButton = UIButton(type: .system)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(parkPass: Pass) {
        pass = parkPass
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.8392156863, blue: 0.8745098039, alpha: 1)
        createNewPassButton.backgroundColor = #colorLiteral(red: 0.416215241, green: 0.6459444165, blue: 0.6289356947, alpha: 1)
        createNewPassButton.setTitle("Create New Pass", for: .normal)
        createNewPassButton.setTitleColor(.white, for: .normal)
        createNewPassButton.addTarget(self, action: #selector(returnToMainView), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(createNewPassButton)
        createNewPassButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createNewPassButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            createNewPassButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            createNewPassButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            createNewPassButton.heightAnchor.constraint(equalToConstant: 49.0)
        ])
        
    }

    @objc func returnToMainView(_ sender: Any) {
        guard let navController  = self.navigationController else {return}
        var viewControllers = navController.viewControllers
        viewControllers.removeLast()
        navController.viewControllers = viewControllers
    }
}

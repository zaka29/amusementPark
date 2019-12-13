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
    
    lazy var topBarLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create New Pass"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    lazy var topBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.416215241, green: 0.6459444165, blue: 0.6289356947, alpha: 1)
        return view
    }()
    
    lazy var viewPassContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    lazy var viewPassTest: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return view
    }()
    
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
        createNewPassButton.translatesAutoresizingMaskIntoConstraints = false
        topBarView.addSubview(topBarLabel)
        view.addSubview(createNewPassButton)
        view.addSubview(topBarView)
        view.addSubview(viewPassContainer)
        view.addSubview(viewPassTest)
        
        NSLayoutConstraint.activate([
            topBarLabel.centerXAnchor.constraint(equalTo: topBarView.centerXAnchor),
            topBarLabel.centerYAnchor.constraint(equalTo: topBarView.centerYAnchor),
            topBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topBarView.heightAnchor.constraint(equalToConstant: 65.0),
            createNewPassButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30.0),
            createNewPassButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30.0),
            createNewPassButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30.0),
            createNewPassButton.heightAnchor.constraint(equalToConstant: 49.0)
        ])
        
//        let viewPassContainerHeight = viewPassContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        let viewPassContainerHeight = viewPassContainer.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 0.4)
        
        let viewPassTestHeigt = viewPassTest.heightAnchor.constraint(equalTo: viewPassContainer.heightAnchor, multiplier: 1.1)
        viewPassTestHeigt.priority = .defaultHigh
        
        // Pass container and Pass test viws layouts
        NSLayoutConstraint.activate([
            viewPassContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.00),
            viewPassContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.00),
            viewPassContainer.topAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: 10.00),
            viewPassContainer.bottomAnchor.constraint(equalTo: viewPassTest.topAnchor, constant: -10.00),
            viewPassContainerHeight,
            viewPassTest.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.00),
            viewPassTest.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.00),
            viewPassTest.bottomAnchor.constraint(equalTo: createNewPassButton.topAnchor, constant: -10.00),
            viewPassTestHeigt
        ])
    
        
        
    }

    @objc func returnToMainView(_ sender: Any) {
        guard let navController  = self.navigationController else {return}
        var viewControllers = navController.viewControllers
        viewControllers.removeLast()
        navController.viewControllers = viewControllers
    }
}

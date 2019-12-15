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
    
    lazy var passImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "FaceImageAsset")
        return imageView
    }()
    
    lazy var topBarLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create New Pass"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    lazy var entrantFullName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entrant Full Name"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    lazy var entrantType: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entrant type"
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    lazy var merchDiscount: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "- Merch discount: %"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    lazy var foodDiscount: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "- Food discount: %"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    lazy var canSkipLines: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "- Can skip lines"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    lazy var testingSectionTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Access Testing"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    lazy var testingSectionInfoText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirm the pass has the expected level of access when swiped at the kiosk"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
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
        return view
    }()
    
    lazy var viewPassBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return view
    }()
    
    lazy var viewPassTest: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewPass: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 8.0
        return view
    }()
    
    lazy var viewPassStatus: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.layer.cornerRadius = 8.0
        return view
    }()
    
    lazy var viewTestButtonsContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.backgroundColor = #colorLiteral(red: 0.416215241, green: 0.6459444165, blue: 0.6289356947, alpha: 1)
        view.distribution = .equalSpacing
        
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
        

        let viewPassContainerHeight = viewPassContainer.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 0.3)
        let viewPassTestHeigt = viewPassTest.heightAnchor.constraint(equalTo: viewPassContainer.heightAnchor, multiplier: 1.2)
        viewPassTestHeigt.priority = .defaultHigh
        
        // Pass container and Pass test viws layouts
        NSLayoutConstraint.activate([
            viewPassContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.00),
            viewPassContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.00),
            viewPassContainer.topAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: 30.00),
            viewPassContainer.bottomAnchor.constraint(equalTo: viewPassTest.topAnchor, constant: -10.00),
            viewPassContainerHeight,
            viewPassTest.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.00),
            viewPassTest.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.00),
            viewPassTest.bottomAnchor.constraint(equalTo: createNewPassButton.topAnchor, constant: -10.00),
            viewPassTestHeigt
        ])
        
        viewPassContainer.addSubview(viewPass)
        
        NSLayoutConstraint.activate([
            viewPass.topAnchor.constraint(equalTo: viewPassContainer.topAnchor, constant: 0),
            viewPass.leadingAnchor.constraint(equalTo: viewPassContainer.leadingAnchor, constant: 0),
            viewPass.trailingAnchor.constraint(equalTo: viewPassContainer.trailingAnchor, constant: 0),
            viewPass.bottomAnchor.constraint(equalTo: viewPassContainer.bottomAnchor, constant: -30.0)
        ])
        
        viewPass.addSubview(passImage)
        
        NSLayoutConstraint.activate([
            passImage.centerYAnchor.constraint(equalTo: viewPass.centerYAnchor),
            passImage.leadingAnchor.constraint(equalTo: viewPass.leadingAnchor, constant: 30.0),
            passImage.widthAnchor.constraint(equalToConstant: 204.0),
            passImage.heightAnchor.constraint(equalToConstant: 198.0)
        ])
        
        viewPass.addSubview(entrantFullName)
        
        NSLayoutConstraint.activate([
            entrantFullName.leadingAnchor.constraint(equalTo: passImage.trailingAnchor, constant: 30),
            entrantFullName.topAnchor.constraint(equalTo: passImage.topAnchor)
        ])
        
        viewPass.addSubview(entrantType)
        
        NSLayoutConstraint.activate([
            entrantType.leadingAnchor.constraint(equalTo: entrantFullName.leadingAnchor),
            entrantType.topAnchor.constraint(equalTo: entrantFullName.bottomAnchor, constant: 15.0)
        ])
        
        viewPass.addSubview(merchDiscount)
        viewPass.addSubview(foodDiscount)
        viewPass.addSubview(canSkipLines)
        
        NSLayoutConstraint.activate([
            merchDiscount.leadingAnchor.constraint(equalTo: entrantType.leadingAnchor),
            merchDiscount.topAnchor.constraint(equalTo: entrantType.bottomAnchor, constant: 30
            ),
            foodDiscount.leadingAnchor.constraint(equalTo: merchDiscount.leadingAnchor),
            foodDiscount.topAnchor.constraint(equalTo: merchDiscount.bottomAnchor, constant: 15.0),
            canSkipLines.leadingAnchor.constraint(equalTo: foodDiscount.leadingAnchor),
            canSkipLines.topAnchor.constraint(equalTo: foodDiscount.bottomAnchor, constant: 15.0)
        ])
        
        let topBorder: CALayer = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: viewPassTest.frame.size.width, height: 1)
        topBorder.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) // UIColor.purple.cgColor
        viewPassTest.layer.addSublayer(topBorder)
        
        
        viewPassTest.addSubview(testingSectionTitle)
        viewPassTest.addSubview(testingSectionInfoText)
        
        
        NSLayoutConstraint.activate([
            testingSectionTitle.centerXAnchor.constraint(equalTo: viewPassTest.centerXAnchor),
            testingSectionTitle.topAnchor.constraint(equalTo: viewPassTest.topAnchor, constant: 30),
            testingSectionInfoText.centerXAnchor.constraint(equalTo: viewPassTest.centerXAnchor),
            testingSectionInfoText.topAnchor.constraint(equalTo: testingSectionTitle.bottomAnchor, constant: 15.0)
        ])
        
        viewPassTest.addSubview(viewPassStatus)
        viewPassTest.addSubview(viewTestButtonsContainer)
        
        let passStatusHeightConstrain = viewPassStatus.heightAnchor.constraint(greaterThanOrEqualTo: viewPassTest.heightAnchor, multiplier: 0.3)
        passStatusHeightConstrain.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            viewPassStatus.bottomAnchor.constraint(equalTo: viewPassTest.bottomAnchor),
            viewPassStatus.leadingAnchor.constraint(equalTo: viewPassTest.leadingAnchor, constant: 0),
            viewPassStatus.trailingAnchor.constraint(equalTo: viewPassTest.trailingAnchor, constant: 0),
            viewTestButtonsContainer.topAnchor.constraint(equalTo: testingSectionInfoText.bottomAnchor, constant: 15.0),
            viewTestButtonsContainer.leadingAnchor.constraint(equalTo: viewPassTest.leadingAnchor, constant: 0),
            viewTestButtonsContainer.trailingAnchor.constraint(equalTo: viewPassTest.trailingAnchor, constant: 0),
            viewTestButtonsContainer.heightAnchor.constraint(equalTo: viewPassTest.heightAnchor, multiplier: 0.4),
            viewPassStatus.topAnchor.constraint(equalTo: viewTestButtonsContainer.bottomAnchor, constant: 10.0),
            passStatusHeightConstrain
            
        ])
        
    }

    @objc func returnToMainView(_ sender: Any) {
        guard let navController  = self.navigationController else {return}
        var viewControllers = navController.viewControllers
        viewControllers.removeLast()
        navController.viewControllers = viewControllers
    }
}

//
//  ViewController.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 26/11/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentEntrantType: EntrantType = .classicGuest

    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    @IBOutlet weak var submenuStackView: UIStackView!
    // Text fields
    @IBOutlet weak var fieldDob: UITextField!
    @IBOutlet weak var fieldSsn: UITextField!
    @IBOutlet weak var fieldProjectNumber: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var streetAddressField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var codeField: UITextField!
    
    
    
    

    @IBOutlet weak var generatePassButton: UIButton!
    @IBOutlet weak var populateDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testGuestsTypes()
        
//        for field in self.textFields {
//            print("this is a field - \(field)")
//        }
        
    }
    
    override func viewWillLayoutSubviews() {
        
        
        
//        fieldDob.alpha = 0.5
//        fieldDob.layer.borderColor = #colorLiteral(red: 0.6133695841, green: 0.5142332911, blue: 0.7238066792, alpha: 1)
//        fieldDob.layer.borderWidth = 1.0
//        fieldDob.layer.cornerRadius = 3.0
        
        generatePassButton.layer.cornerRadius = 3.0
        populateDataButton.layer.cornerRadius = 3.0
        
//        fieldSsn.alpha = 0.5
//        fieldSsn.layer.borderColor = #colorLiteral(red: 0.6335280538, green: 0.5039176941, blue: 0.7410507798, alpha: 1)
//        fieldSsn.layer.borderWidth = 1.0
//        fieldSsn.layer.cornerRadius = 3.0
//
//        fieldProjectNumber.alpha = 0.5
//        fieldProjectNumber.layer.borderColor = #colorLiteral(red: 0.6335280538, green: 0.5039176941, blue: 0.7410507798, alpha: 1)
//        fieldProjectNumber.layer.borderWidth = 1.0
//        fieldProjectNumber.layer.cornerRadius = 3.0
    }
    
    func swipeRidesAccess(for entrant: Entrant) -> Bool {
        return entrant.hasRidesAccess
    }
    
    func swipeAreaAcces(for entrant: Entrant, to area: AreaAccess) -> Bool {
        var permisionGranted: Bool = false
        let accessPermissions = entrant.getAreaAccess()
        
        for permission in accessPermissions {
            if (permission == area) {
                permisionGranted = true
            }
        }
        return permisionGranted
    }
    
    // Test cases
    func testGuestsTypes(){
        // VIP GUEST
        let vipGuest = Entrant(entrantType: .vipGuest)
        // can skip lines
        print("Vip Guest can skip lines - \(vipGuest.canSkipLines())")
        // has food discount
        print("Vip guest has food discount of - \(vipGuest.foodDiscount())")
        // can access the rides
        print("Vip guest has access to the rides - \(swipeRidesAccess(for: vipGuest))")
        // can access kitchen area
        print("Vip guest has access to kitchen areas - \(swipeAreaAcces(for: vipGuest, to: .kitchenArea))")
        // can aceess office
        print("Vip guest has access to office areas - \(swipeAreaAcces(for: vipGuest, to: .officeArea))")
        
        // Hourly employee kitchen area
        let kitchenWorker = Entrant(entrantType: .hourlyEmployeeFood)
        // can skip lines
        print("Enum value call - \(RideAccess.skipLines(canSkipLine: true))")
        print("Kitchen worker can skip lines - \(kitchenWorker.canSkipLines())")
        // has food discount
        print("Kitchen worker has food discount of - \(kitchenWorker.foodDiscount())")
        // can access the rides
        print("Kitchen worker has access to the rides - \(swipeRidesAccess(for: kitchenWorker))")
        // can access kitchen area
        print("Kitchen worker has access to kitchen areas - \(swipeAreaAcces(for: kitchenWorker, to: .kitchenArea))")
        // can aceess office
        print("Kitchen worker has access to office areas - \(swipeAreaAcces(for: kitchenWorker, to: .officeArea))")
        
    }

    @IBAction func onMenuItemTap(_ sender: UIButton) {
        print("Button clicked - \(String(describing: sender.titleLabel?.text))")
        submenuStackView.subviews.forEach {$0.removeFromSuperview()}
        deactivateAllFields()
        
        switch sender.titleLabel?.text {
        case "Guest":
            let subMenu = Submenu(for: .guest)
            guard let menuItems = subMenu.generateSubmenuItems() else { return }
            subMenu.populateSubmenu(with: menuItems, for: submenuStackView)
        case "Employee":
            let subMenu = Submenu(for: .employee)
            guard let menuItems = subMenu.generateSubmenuItems() else { return }
            subMenu.populateSubmenu(with: menuItems, for: submenuStackView)
        case "Contractor":
            let subMenu = Submenu(for: .contractor)
            guard let menuItems = subMenu.generateSubmenuItems() else { return }
            subMenu.populateSubmenu(with: menuItems, for: submenuStackView)
        case "Manager":
            let subMenu = Submenu(for: .manager)
            guard let menuItems = subMenu.generateSubmenuItems() else { return }
            subMenu.populateSubmenu(with: menuItems, for: submenuStackView)
        case "Vendor":
            let subMenu = Submenu(for: .vendor)
            guard let menuItems = subMenu.generateSubmenuItems() else { return }
            subMenu.populateSubmenu(with: menuItems, for: submenuStackView)
            
        default : return
        }
    }
    
    @objc func subMenuItemsActionHandler(_ responder: UIButton) {
        deactivateAllFields()
        switch responder.titleLabel?.text {
        case "Child":
            currentEntrantType = .freeChild
            fieldDob.isEnabled = true
            fieldDob.alpha = 1.0
            
        case "Adult":
            deactivateAllFields()
            currentEntrantType = .classicGuest
        case "Senior":
            currentEntrantType = .seniorGuest
        case "Vip":
            currentEntrantType = .vipGuest
        case "Season Pass":
            currentEntrantType = .seasonPass
        default:
            print("button is clicked \(String(describing: responder.titleLabel?.text))")
            
        }
    }
    
    func deactivateAllFields() {
        fieldDob.isEnabled = false
        fieldDob.alpha = 0.5
        fieldSsn.isEnabled = false
        fieldProjectNumber.isEnabled = false
    }
    
    @IBAction func populateDateAction(_ sender: UIButton) {
        print("populate data and currently selected - \(currentEntrantType)")
        switch currentEntrantType {
        case .classicGuest:
            print("button selected ->>")
        case .seniorGuest:
            print("button selected ->>")
        case .seasonPass:
            print("button selected ->>")
        case .vipGuest:
            let vipTestData = GuestPersonalInformation(address: Address())
            firstNameField.text = vipTestData.firstName
            lastNameField.text = vipTestData.lastName
            streetAddressField.text = vipTestData.address?.street
            cityField.text = vipTestData.address?.city
            stateField.text = vipTestData.address?.state
            codeField.text = vipTestData.address?.code
            
            print("button selected ->>")
    
        case .freeChild:
            let freeChildTestData = FreeChildData()
            fieldDob.text = freeChildTestData.dateString
            fieldDob.alpha = 1
            
        case .hourlyEmployeeFood:
            print("button selected ->>")
        case .hourlyEmployeeService:
            print("button selected ->>")
        case .hourlyEmployeeMaintenance:
            print("button selected ->>")
        case .manager:
            print("button selected ->>")
        case .contractor:
            print("button selected ->>")
        case .vendor:
            print("button selected ->>")
        }
    }
    
    
    func generatePass() {
        
    }
}


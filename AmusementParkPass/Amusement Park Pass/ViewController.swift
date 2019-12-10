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
    

    @IBOutlet var fields: [UITextField]!
    
    @IBOutlet weak var generatePassButton: UIButton!
    @IBOutlet weak var populateDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testGuestsTypes()
        applyFieldsStyles()
    }
    
    override func viewWillLayoutSubviews() {
        generatePassButton.layer.cornerRadius = 3.0
        populateDataButton.layer.cornerRadius = 3.0
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
    
    func applyFieldsStyles() {
        for field in self.fields {
            field.alpha = 0.5
            field.layer.borderColor = #colorLiteral(red: 0.6335280538, green: 0.5039176941, blue: 0.7410507798, alpha: 1)
            field.layer.borderWidth = 1.0
            field.layer.cornerRadius = 3.0
        }
    }
    
    func cleanAllFields() {
        for field in self.fields {
            field.text?.removeAll()
        }
    }
    
    func deactivateAllFields() {
        for field in self.fields {
            field.isEnabled = false
            field.alpha = 0.5
        }
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
        cleanAllFields()
        
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
            currentEntrantType = .manager
            fieldDob.isEnabled = true
            fieldSsn.isEnabled = true
            firstNameField.isEnabled = true
            lastNameField.isEnabled = true
            streetAddressField.isEnabled = true
            cityField.isEnabled = true
            stateField.isEnabled = true
            codeField.isEnabled = true
            fieldDob.alpha = 1
            fieldSsn.alpha = 1
            firstNameField.alpha = 1
            lastNameField.alpha = 1
            streetAddressField.alpha = 1
            cityField.alpha = 1
            stateField.alpha = 1
            codeField.alpha = 1
            
        case "Vendor":
            let subMenu = Submenu(for: .vendor)
            guard let menuItems = subMenu.generateSubmenuItems() else { return }
            subMenu.populateSubmenu(with: menuItems, for: submenuStackView)
            
        default : return
        }
    }
    
    @objc func subMenuItemsActionHandler(_ responder: UIButton) {
        deactivateAllFields()
        cleanAllFields()
        
        switch responder.titleLabel?.text {
        case "Child":
            currentEntrantType = .freeChild
            fieldDob.isEnabled = true
            fieldDob.alpha = 1.0
            
        case "Adult": currentEntrantType = .classicGuest
        case "Senior":
            currentEntrantType = .seniorGuest
            fieldDob.isEnabled = true
            fieldDob.alpha = 1
            firstNameField.isEnabled = true
            firstNameField.alpha = 1
            lastNameField.isEnabled = true
            lastNameField.alpha = 1
            
        case "Vip": currentEntrantType = .vipGuest
        case "Season Pass":
            currentEntrantType = .seasonPass
            fieldDob.isEnabled = true
            fieldDob.alpha = 1
            firstNameField.isEnabled = true
            firstNameField.alpha = 1
            lastNameField.isEnabled = true
            lastNameField.alpha = 1
            streetAddressField.isEnabled = true
            streetAddressField.alpha = 1
            cityField.isEnabled = true
            cityField.alpha = 1
            stateField.isEnabled = true
            stateField.alpha = 1
            codeField.isEnabled = true
            codeField.alpha = 1
            
        case "Food services":
            currentEntrantType = .hourlyEmployeeFood
            fieldDob.isEnabled = true
            fieldSsn.isEnabled = true
            firstNameField.isEnabled = true
            lastNameField.isEnabled = true
            streetAddressField.isEnabled = true
            cityField.isEnabled = true
            stateField.isEnabled = true
            codeField.isEnabled = true
            fieldDob.alpha = 1
            fieldSsn.alpha = 1
            firstNameField.alpha = 1
            lastNameField.alpha = 1
            streetAddressField.alpha = 1
            cityField.alpha = 1
            stateField.alpha = 1
            codeField.alpha = 1
            
        case "Ride services":
            currentEntrantType = .hourlyEmployeeService
            fieldDob.isEnabled = true
            fieldSsn.isEnabled = true
            firstNameField.isEnabled = true
            lastNameField.isEnabled = true
            streetAddressField.isEnabled = true
            cityField.isEnabled = true
            stateField.isEnabled = true
            codeField.isEnabled = true
            fieldDob.alpha = 1
            fieldSsn.alpha = 1
            firstNameField.alpha = 1
            lastNameField.alpha = 1
            streetAddressField.alpha = 1
            cityField.alpha = 1
            stateField.alpha = 1
            codeField.alpha = 1
        case "Maintenance":
            currentEntrantType = .hourlyEmployeeMaintenance
            fieldDob.isEnabled = true
            fieldSsn.isEnabled = true
            firstNameField.isEnabled = true
            lastNameField.isEnabled = true
            streetAddressField.isEnabled = true
            cityField.isEnabled = true
            stateField.isEnabled = true
            codeField.isEnabled = true
            fieldDob.alpha = 1
            fieldSsn.alpha = 1
            firstNameField.alpha = 1
            lastNameField.alpha = 1
            streetAddressField.alpha = 1
            cityField.alpha = 1
            stateField.alpha = 1
            codeField.alpha = 1
            
        case "Contractor": currentEntrantType = .contractor
        case "Vendor": currentEntrantType = .vendor
            
        default:
            print("button is clicked \(String(describing: responder.titleLabel?.text))")
        }
    }

    
    @IBAction func populateDateAction(_ sender: UIButton) {
        print("populate data and currently selected - \(currentEntrantType)")
        
        
        switch currentEntrantType {
        case .classicGuest:
            print("button selected ->>")
        case .seniorGuest:
            let seniorGuestData = GuestPersonalInformation(address: GuestAddress())
            fieldDob.text = seniorGuestData.dateString
            firstNameField.text = seniorGuestData.firstName
            lastNameField.text = seniorGuestData.lastName
            
        case .seasonPass:
            let seasonPassData = GuestPersonalInformation(address: GuestAddress())
            fieldDob.text = seasonPassData.dateString
            firstNameField.text = seasonPassData.firstName
            lastNameField.text = seasonPassData.lastName
            streetAddressField.text = seasonPassData.address.street
            cityField.text = seasonPassData.address.city
            stateField.text = seasonPassData.address.state
            codeField.text = seasonPassData.address.code
            
        case .vipGuest:
            print("button selected ->>")
    
        case .freeChild:
            let freeChildTestData = FreeChildData()
            fieldDob.text = freeChildTestData.dateString
            fieldDob.alpha = 1
            
        case .hourlyEmployeeFood, .hourlyEmployeeService, .hourlyEmployeeMaintenance:
            let employeeData = EmployeeBusinessInformation(address: EmployeeAddress())
            fieldDob.text = employeeData.dobString
            firstNameField.text = employeeData.firstName
            lastNameField.text = employeeData.lastName
            fieldSsn.text = employeeData.socialSecurityNumber
            streetAddressField.text = employeeData.address.street
            cityField.text = employeeData.address.city
            stateField.text = employeeData.address.state
            codeField.text = employeeData.address.code
            
        case .manager:
            let managerData = ManagerBusinessInformation(address: ManagerAddress())
            fieldDob.text = managerData.dobString
            firstNameField.text = managerData.firstName
            lastNameField.text = managerData.lastName
            fieldSsn.text = managerData.socialSecurityNumber
            streetAddressField.text = managerData.address.street
            cityField.text = managerData.address.city
            stateField.text = managerData.address.state
            codeField.text = managerData.address.code
            
        case .contractor:
            print("button selected ->>")
        case .vendor:
            print("button selected ->>")
        }
    }
    
    
    func generatePass() {
        
    }
}


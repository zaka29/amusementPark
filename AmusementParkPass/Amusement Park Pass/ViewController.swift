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
        generatePassButton.addTarget(self, action: #selector(generatePass), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        generatePassButton.layer.cornerRadius = 3.0
        populateDataButton.layer.cornerRadius = 3.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
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
        let vipGuest = Entrant(entrantType: .vipGuest, canAccessRides: true)
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
        
    }

    @IBAction func onMenuItemTap(_ sender: UIButton) {
        print("Button clicked - \(String(describing: sender.titleLabel?.text))")
        submenuStackView.subviews.forEach {$0.removeFromSuperview()}
        deactivateAllFields()
        cleanAllFields()
        
        switch sender.titleLabel?.text {
        case "Guest":
            currentEntrantType = .classicGuest
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
        case .classicGuest, .vipGuest:
            print("button selected ->>")
            
        case .seniorGuest:
            let seniorGuestData = GuestPersonalDetails(address: Address())
            fieldDob.text = seniorGuestData.dobString
            firstNameField.text = seniorGuestData.firstName
            lastNameField.text = seniorGuestData.lastName
            
        case .seasonPass:
            let seasonPassData = GuestPersonalDetails(address: Address())
            fieldDob.text = seasonPassData.dobString
            firstNameField.text = seasonPassData.firstName
            lastNameField.text = seasonPassData.lastName
            streetAddressField.text = seasonPassData.address.street
            cityField.text = seasonPassData.address.city
            stateField.text = seasonPassData.address.state
            codeField.text = seasonPassData.address.code
    
        case .freeChild:
            let freeChildTestData = FreeChildData()
            fieldDob.text = freeChildTestData.dateString
            fieldDob.alpha = 1
            
        case .hourlyEmployeeFood, .hourlyEmployeeService, .hourlyEmployeeMaintenance:
            let employeeData = EmployeeBusinessDetails(address: Address())
            fieldDob.text = employeeData.dobString
            firstNameField.text = employeeData.firstName
            lastNameField.text = employeeData.lastName
            fieldSsn.text = employeeData.socialSecurityNumber
            streetAddressField.text = employeeData.address.street
            cityField.text = employeeData.address.city
            stateField.text = employeeData.address.state
            codeField.text = employeeData.address.code
            
        case .manager:
            let managerData = EmployeeBusinessDetails(address: Address(), managerTier: "Senior")
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
    
    
    @objc func generatePass() {
        
        var guest: Entrant?
        let alert = UIAlertController(title: "Generate Pass Error", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.message = ""
        
        // switch based on selection type, potentially move to a factory method
        switch self.currentEntrantType {
        case .classicGuest:
            guest = ClassicGuest()
        
        case .contractor:
            print("this is a guest")
            
        case .freeChild:
            do {
                try guest = FreeChild(dateString: fieldDob.text ?? "")
            } catch ChildError.dateOfBirthRequired(let message) {
                alert.message = message
                self.present(alert, animated: true, completion: nil)
            } catch {
                print("something else happened")
            }
            
        case .hourlyEmployeeFood:
            print("this is a guest")
            
        case .hourlyEmployeeMaintenance:
            print("this is a guest")
            
        case .hourlyEmployeeService:
            print("this is a guest")
        case .manager:
            print("this is a guest")
        case .seasonPass:
            var address = Address()
            address.street = streetAddressField.text ?? ""
            address.city = cityField.text ?? ""
            address.code = codeField.text ?? ""
            address.state = stateField.text ?? ""
            
            var details = GuestPersonalDetails(address: address)
            details.dobString = fieldDob.text ?? ""
            details.firstName = firstNameField.text ?? ""
            details.lastName = lastNameField.text ?? ""
            
            do {
                try guest = SeasonPassGuest(guestDetails: details)
            } catch GuestError.dateOfBirthRequired(let message) {
                alert.message = message
                self.present(alert, animated: true, completion: nil)
            } catch GuestError.personalDetailsRequires(let message) {
                alert.message = message
                self.present(alert, animated: true, completion: nil)
            } catch {
                print("something else happened")
            }
            
        case .seniorGuest:
            print("this is a guest")
        case .vendor:
            print("this is a guest")
        case .vipGuest:
            print("this is a guest")
        }
        
        if let guest = guest {
            let pass = Pass(guest)
            let passPageController = PassPageController(parkPass: pass)
            navigationController?.pushViewController(passPageController, animated: true)
            navigationController?.isNavigationBarHidden = true
        } else {
            //TODO: Show some notice
            print("Guest must be provided")
        }
        
    }
}


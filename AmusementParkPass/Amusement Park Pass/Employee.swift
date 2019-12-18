//
//  Employee.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 18/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

enum EmployeeError: Error {
    case businessInformationRequired(message: String)
    case personalInformationRequired(message: String)
}

struct EmployeeBusinessDetails {
    var firstName = "Gendalf"
    var lastName = "White"
    var socialSecurityNumber = "777334644"
    var dobString = "12/25/1900"
    var address: Address
    var managerTier: String?
        
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func settName(_ firstName: String) {
        self.firstName = firstName
    }
    
    mutating func setName(_ lastName: String) {
        self.lastName = lastName
    }
    
}

class Employee: Entrant {
    var employeeBusinessDetails: EmployeeBusinessDetails
    
    init(employeeType type: EntrantType, businessDetails details: EmployeeBusinessDetails) throws {
        
        if !Employee.validateDate(details.dobString) {
            throw EmployeeError.businessInformationRequired(message: "please enter valid date in mm/dd/yyyy format")
        }
        
        guard !details.firstName.isEmpty else {
            throw EmployeeError.businessInformationRequired(message: "Name is required")
        }

        guard !details.lastName.isEmpty else {
            throw EmployeeError.businessInformationRequired(message: "Last name is required")
        }
        
        guard !details.socialSecurityNumber.isEmpty else {
            throw EmployeeError.businessInformationRequired(message: "Social security number must be provided")
        }

        guard !details.address.city.isEmpty else {
            throw EmployeeError.businessInformationRequired(message: "City is required")
        }

        guard !details.address.street.isEmpty else {
            throw EmployeeError.businessInformationRequired(message: "Street is reqiured")
        }

        guard !details.address.state.isEmpty else {
            throw EmployeeError.businessInformationRequired(message: "State is required")
        }

        guard !details.address.code.isEmpty else {
            throw EmployeeError.businessInformationRequired(message: "Code is reqiured")
        }
        
        employeeBusinessDetails = details
        super.init(entrantType: type, canAccessRides: true)
    }
    
    static func validateDate(_ date: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        if (dateFormatter.date(from: date) != nil) {
            return true
        } else {
            return false
        }
    }
}

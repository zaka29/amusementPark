//
//  HourlyEmployee.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 27/11/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

enum EmployeeError: Error {
    case businessInformationRequired(message: String)
    case personalInformationRequired(message: String)
}

struct EmployeeAddress {
    var city = "Melbourne"
    var street = "Unit 3 5 Fitzroy Ave"
    var state = "VIC"
    var code = "4005"
    
    var fullAddress: String {
        return "\(street) \n \(city) \(state) \(code)"
    }
}

struct EmployeeBusinessInformation {
    var firstName = "Joshua"
    var lastName = "Smith"
    var socialSecurityNumber = "777334644"
    var dobString = "12/25/2000"
    var address: EmployeeAddress
        
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    // add setters
    mutating func settName(_ firstName: String) {
        self.firstName = firstName
    }
    
    mutating func setName(_ lastName: String) {
        self.lastName = lastName
    }
    
}

class HourlyEmployee: Entrant {
    
    var empolyeeInformation: EmployeeBusinessInformation
    
    init(type: EntrantType, businessInformation information: EmployeeBusinessInformation) {
        empolyeeInformation = information
        super.init(entrantType: type, canAccessRides: true)
    }
    
    func getEmloyeeAddress() -> String {
        return empolyeeInformation.address.fullAddress
    }
    
    func fullName() -> String {
        return empolyeeInformation.fullName
    }
}

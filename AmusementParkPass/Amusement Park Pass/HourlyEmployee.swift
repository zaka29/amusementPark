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

struct EmployeeBusinessInformation {
    var firstName: String
    var lastName: String
    var socialSecurityNumber: String
    var dob: String
    var city: String
    var street: String
    var state: String
    var zip: String
    
    var fullAddress: String {
        return "\(street) \n \(city) \(state) \(zip)"
    }
    
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
        return empolyeeInformation.fullAddress
    }
    
    func fullName() -> String {
        return empolyeeInformation.fullName
    }
}

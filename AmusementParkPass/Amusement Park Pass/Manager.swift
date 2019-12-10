//
//  Manager.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 10/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

struct ManagerAddress {
    var city = "Sydney"
    var street = "Unit 3 5 Bondi Beach Rd"
    var state = "NSW"
    var code = "3005"
    
    var fullAddress: String {
        return "\(street) \n \(city) \(state) \(code)"
    }
}

struct ManagerBusinessInformation {
    var firstName = "Gendalf"
    var lastName = "White"
    var socialSecurityNumber = "777334644"
    var dobString = "12/25/1900"
    var address: ManagerAddress
    var tier = "Senior wizzard"
        
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

class Manager: Entrant {
    var businessDetails: ManagerBusinessInformation
    
    init(type: EntrantType, businessDetails details: ManagerBusinessInformation) {
        businessDetails = details
        super.init(entrantType: type, canAccessRides: true)
    }
}

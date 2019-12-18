//
//  Guest.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 9/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

enum GuestError: Error {
    case dateOfBirthRequired(message: String)
    case personalDetailsRequires(message: String)
}

struct Address {
    var city = "Melbourne"
    var street = "Unit 3 5 Fitzroy Ave"
    var state = "VIC"
    var code = "4005"
    
    var fullAddress: String {
        return "\(street) \n \(city) \(state) \(code)"
    }
}

struct GuestPersonalDetails {
    var firstName = "Joshua"
    var lastName = "Smith"
    var dobString = "12/25/2000"
    var address: Address
    
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

class ClassicGuest: Entrant {
    init() {
        super.init(entrantType: .classicGuest, canAccessRides: true)
    }
}


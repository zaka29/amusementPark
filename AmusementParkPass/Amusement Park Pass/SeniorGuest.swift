//
//  VipGuest.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 12/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

class SeniorGuest: Entrant {
    
    init(guestDetails details: GuestPersonalDetails) throws {
        
        guard !details.firstName.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Name is required")
        }
        
        guard !details.lastName.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Last name is required")
        }
        
        if !SeniorGuest.validateDate(details.dobString) {
            throw GuestError.dateOfBirthRequired(message: "please enter valid date in mm/dd/yyyy format")
        }
        
        super.init(entrantType: .seniorGuest, canAccessRides: true)
        self.entrantDetails = details
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

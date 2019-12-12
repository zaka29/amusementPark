//
//  VipGuest.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 12/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

class SeniorGuest: Entrant {
    var guestPersonalDetails: GuestPersonalDetails
    
    init(guestDetails details: GuestPersonalDetails) throws {
        guestPersonalDetails = details
        super.init(entrantType: .seniorGuest, canAccessRides: true)
        
        guard !guestPersonalDetails.firstName.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Name is required")
        }
        
        guard !guestPersonalDetails.lastName.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Last name is required")
        }
        
        if !validateDate(guestPersonalDetails.dobString) {
            throw GuestError.dateOfBirthRequired(message: "please enter valid date in mm/dd/yyyy format")
        }
        
        
    }
    
    func validateDate(_ date: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        if (dateFormatter.date(from: date) != nil) {
            return true
        } else {
            return false
        }
    }
}

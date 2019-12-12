//
//  SeasonPass.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 12/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation


class SeasonPassGuest: Entrant {
    var guestPersonalDetails: GuestPersonalDetails
    
    // do a throwing initialisation here
    init(guestDetais details: GuestPersonalDetails ) throws {
        guestPersonalDetails = details
        super.init(entrantType: .seasonPass, canAccessRides: true)
        
        if !validateDate(guestPersonalDetails.dobString) {
            throw GuestError.dateOfBirthRequired(message: "please enter valid date in mm/dd/yyyy format")
        }
        
        guard !guestPersonalDetails.firstName.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Name is required")
        }
        
        guard !guestPersonalDetails.lastName.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Last name is required")
        }
        
        guard !guestPersonalDetails.address.city.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "City is required")
        }
        
        guard !guestPersonalDetails.address.street.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Street is reqiured")
        }
        
        guard !guestPersonalDetails.address.state.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "State is required")
        }
        
        guard !guestPersonalDetails.address.code.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Code is reqiured")
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

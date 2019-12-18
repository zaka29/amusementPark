//
//  SeasonPass.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 12/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation


class SeasonPassGuest: Entrant {

    init(guestDetails details: GuestPersonalDetails ) throws {
        
        if !SeasonPassGuest.validateDate(details.dobString) {
            throw GuestError.dateOfBirthRequired(message: "please enter valid date in mm/dd/yyyy format")
        }
        
        guard !details.firstName.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Name is required")
        }

        guard !details.lastName.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Last name is required")
        }

        guard !details.address.city.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "City is required")
        }

        guard !details.address.street.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Street is reqiured")
        }

        guard !details.address.state.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "State is required")
        }

        guard !details.address.code.isEmpty else {
            throw GuestError.personalDetailsRequires(message: "Code is reqiured")
        }
        
        super.init(entrantType: .seasonPass, canAccessRides: true)
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

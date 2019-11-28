//
//  FreeChild.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 27/11/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

enum ChildError: Error {
    case dateOfBirthRequired
}

class FreeChild: Entrant {
    var dateOfBirth: Date
    
    init(entrantType: EntrantType, date: Date) {
        dateOfBirth = date
        super.init(entrantType: entrantType, canAccessRides: true)
    }
    
    // Add get set DOB
}

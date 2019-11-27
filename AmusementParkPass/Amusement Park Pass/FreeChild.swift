//
//  FreeChild.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 27/11/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

class FreeChild: Entrant {
    var dateOfBirth: Date
    
    init(entrantType: EntrantType, date: Date) {
        // do some checks and validation logic to make sure it's an actual child
        dateOfBirth = date
        super.init(entrantType: <#T##EntrantType#>)
    }
    
    // Add get set DOB
}

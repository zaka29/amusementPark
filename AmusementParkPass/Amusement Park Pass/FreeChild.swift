//
//  FreeChild.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 27/11/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

enum ChildError: Error {
    case dateOfBirthRequired(message: String)
}

struct FreeChildData {
    var dateString = "09/23/2017"
    var dateOfBirth: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        
        guard let formattedDate = dateFormatter.date(from: dateString) else {return nil}
        
        return formattedDate
    }
}

class FreeChild: Entrant {
    var dateOfBirth: Date
    
    init(dateString date: String) throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        
        guard let dateFormatted = dateFormatter.date(from: date) else {
            throw ChildError.dateOfBirthRequired(message: "please enter valid date in mm/dd/yyyy format")
        }
        
        dateOfBirth = dateFormatted
        super.init(entrantType: .freeChild, canAccessRides: true)
    }
    
    func convertDate(toString fromDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        return dateFormatter.string(from: fromDate)
    }
    
    func getFormattedDob() -> String {
        return convertDate(toString: dateOfBirth)
    }

}

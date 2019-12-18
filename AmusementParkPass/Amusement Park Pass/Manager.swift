//
//  Manager.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 10/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

class Manager: Employee {
    
    init(mnagerBusinessDetails details: EmployeeBusinessDetails) throws {
        
        guard details.managerTier != nil else {
            throw EmployeeError.businessInformationRequired(message: "Tier is required for all managers")
        }
        
        try super.init(employeeType: .manager, businessDetails: details)
 
    }
}

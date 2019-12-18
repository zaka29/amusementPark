//
//  HourlyEmployee.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 27/11/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

class HourlyEmployee: Employee {
    
    init(hourlyEmployeeType type: EntrantType, employeeBusinessDetails: EmployeeBusinessDetails) throws {
        
        try super.init(employeeType: type, businessDetails: employeeBusinessDetails)
    }
    
    func getEmloyeeAddress() -> String {
        return self.employeeBusinessDetails.address.fullAddress
    }
    
    func fullName() -> String {
        return self.employeeBusinessDetails.fullName
    }
}

//
//  Pass.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 12/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

class Pass {
    private var entrant: EntrantProtocol
    private var ridesAccesSkipLines: Bool
    private var entrantType: EntrantType
    
    var entrantFullName: String?
    var merchDiscount: String
    var foodDiscount: String
        
    init(_ forEntrant: EntrantProtocol) {
        self.entrant = forEntrant
        self.entrantFullName = forEntrant.entrantDetails?.fullName
        self.merchDiscount = forEntrant.merchandiseDidcount()
        self.foodDiscount = forEntrant.foodDiscount()
        self.ridesAccesSkipLines = forEntrant.hasRidesAccess
        self.entrantType = forEntrant.type
    }
    
    func canEntrantSkiplines() -> Bool {
        return ridesAccesSkipLines
    }
    
    func getEntrantType() -> String {
        switch self.entrantType {
        case .classicGuest: return "Adult"
        case .contractor: return "Contractor"
        case .freeChild: return "Free Child"
        case .hourlyEmployeeFood: return "Hourly Employee Food"
        case .hourlyEmployeeMaintenance: return "Hourly Employee Maintenance"
        case .hourlyEmployeeService: return "Hourly Employee Service"
        case .manager: return "Manager"
        case .seasonPass: return "Season Pass Guest"
        case .seniorGuest: return "Senior Guest"
        case .vendor: return "Vendor"
        case .vipGuest: return "Vip Guest Pass"
        }
    }
    
    func getFullName() -> String {
        
        if let fullName = self.entrantFullName {
            return fullName
        }
        
        if (self.entrantType == .classicGuest){
            return "Adult Pass"
        }
        
        if (self.entrantType == .freeChild){
            return "Free Child Pass"
        }
        
        return "Vip Guest"
        
    }
}

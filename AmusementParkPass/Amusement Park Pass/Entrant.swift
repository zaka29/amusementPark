//
//  Entrant.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 27/11/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

enum EntrantType {
    case classicGuest
    case vipGuest
    case freeChild
    case hourlyEmployeeFood
    case hourlyEmployeeService
    case hourlyEmployeeMaintainance
    case manager
}

extension EntrantType {
    var foodDiscount: String {
        switch self {
        case .classicGuest: return ""
        case .freeChild: return ""
        case .vipGuest: return "10%"
        case .hourlyEmployeeFood: return "15%"
        case .hourlyEmployeeMaintainance: return "15%"
        case .hourlyEmployeeService: return "15%"
        case .manager: return "25%"
        }
    }
        
    var discountMerchandise: String {
        switch self {
        case .classicGuest: return ""
        case .freeChild: return ""
        case .vipGuest: return "20%"
        case .hourlyEmployeeFood: return "25%"
        case .hourlyEmployeeMaintainance: return "25%"
        case .hourlyEmployeeService: return "25%"
        case .manager: return "25%"
        }
    }
}

class Entrant {
    var type: EntrantType
    
    init(entrantType: EntrantType) {
        type = entrantType
    }
    
    func getAreaAccess() -> [AreaAccess] {
        switch self.type {
        case .classicGuest: return [.amusementArea]
        case .vipGuest: return[.amusementArea]
        case .freeChild: return [.amusementArea]
        case .hourlyEmployeeFood: return [.kitchenArea, .amusementArea]
        case .hourlyEmployeeService: return [.amusementArea, .rideControlArea]
        case .hourlyEmployeeMaintainance: return [.maintainanceArea, .amusementArea]
        case .manager: return [.amusementArea, .rideControlArea, .kitchenArea, .maintainanceArea, .officeArea]
        }
    }
        
    func canSkipLines() -> RideAccess {
        switch self.type {
        case .vipGuest: return .skipLines(canSkipLine: true)
        case .classicGuest, .freeChild, .hourlyEmployeeFood, .hourlyEmployeeMaintainance, .hourlyEmployeeService, .manager: return .skipLines(canSkipLine: false)
        }
    }
    
    func foodDiscount() -> String {
        return type.foodDiscount
    }
    
    func merchandiseDidcount() -> String {
        return type.discountMerchandise
    }
}



//
//  Guest.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 9/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

enum GuestError: Error {
    case informationRequired(message: String)
}

struct GuestAddress {
    var city = "Brisbane"
    var street = "Unit 3 5 Computer Street"
    var state = "QLD"
    var code = "4005"
    
    var fullAddress: String {
        return "\(street) \n \(city) \(state) \(code)"
    }
}

struct GuestPersonalInformation {
    var firstName = "Crocodile"
    var lastName = "Dundee"
    var dateString = "09/23/2017"
    var address: GuestAddress
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var dateOfBirth: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        
        guard let formattedDate = dateFormatter.date(from: dateString) else {return nil}
        
        return formattedDate
    }
    
    // add setters
    mutating func setName(firstName name: String) throws {
        guard !name.isEmpty else {
            throw GuestError.informationRequired(message: "Name maust be provided")
        }
        
        self.firstName = name
    }
    
    mutating func setName(lastName name: String) throws {
        guard !name.isEmpty else {
           throw GuestError.informationRequired(message: "Last name maust be provided")
        }
        
        self.lastName = name
    }
    
}

class Guest: Entrant {
    var personalInformation: GuestPersonalInformation?
    
    // to do: make a failable initialiser like in Free Child
    
    init(type: EntrantType, guestInformation info: GuestPersonalInformation) {
        personalInformation = info
        super.init(entrantType: type,  canAccessRides: true)
    }
    
    func setName(firstName name: String){
        do {
           try personalInformation?.setName(firstName: name)
        } catch GuestError.informationRequired(let message) {
            print("Guest error -  \(message)")
        } catch {
            print("unexpected error")
        }
    }
    
    func setName(lastName name: String){
        do {
            try personalInformation?.setName(lastName: name)
        } catch GuestError.informationRequired(let message) {
            print("Guest error - \(message)")
        } catch {
            print("Unexpected error")
        }
    }

}




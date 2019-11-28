//
//  ViewController.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 26/11/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testGuestsTypes()
    }
    
    func swipeRidesAccess(for entrant: Entrant) -> Bool {
        return entrant.hasRidesAccess
    }
    
    func swipeAreaAcces(for entrant: Entrant, to area: AreaAccess) -> Bool {
        var permisionGranted: Bool = false
        let accessPermissions = entrant.getAreaAccess()
        
        for permission in accessPermissions {
            if (permission == area) {
                permisionGranted = true
            }
        }
        return permisionGranted
    }
    
    // Test cases
    func testGuestsTypes(){
        // VIP GUEST
        let vipGuest = Entrant(entrantType: .vipGuest)
        // can skip lines
        print("Vip Guest can skip lines - \(vipGuest.canSkipLines())")
        // has food discount
        print("Vip guest has food discount of - \(vipGuest.foodDiscount())")
        // can access the rides
        print("Vip guest has access to the rides - \(swipeRidesAccess(for: vipGuest))")
        // can access kitchen area
        print("Vip guest has access to kitchen areas - \(swipeAreaAcces(for: vipGuest, to: .kitchenArea))")
        // can aceess office
        print("Vip guest has access to office areas - \(swipeAreaAcces(for: vipGuest, to: .officeArea))")
        
        // Hourly employee kitchen area
        let kitchenWorker = Entrant(entrantType: .hourlyEmployeeFood)
        // can skip lines
        print("Enum value call - \(RideAccess.skipLines(canSkipLine: true))")
        print("Kitchen worker can skip lines - \(kitchenWorker.canSkipLines())")
        // has food discount
        print("Kitchen worker has food discount of - \(kitchenWorker.foodDiscount())")
        // can access the rides
        print("Kitchen worker has access to the rides - \(swipeRidesAccess(for: kitchenWorker))")
        // can access kitchen area
        print("Kitchen worker has access to kitchen areas - \(swipeAreaAcces(for: kitchenWorker, to: .kitchenArea))")
        // can aceess office
        print("Kitchen worker has access to office areas - \(swipeAreaAcces(for: kitchenWorker, to: .officeArea))")
        
    }

}


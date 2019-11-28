//
//  Access.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 27/11/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

enum AreaAccess {
    case amusementArea
    case kitchenArea
    case rideControlArea
    case maintainanceArea
    case officeArea
}

enum RideAccess {
    case skipLines(canSkipLine: Bool)
}

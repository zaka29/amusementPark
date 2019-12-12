//
//  VipGuest.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 12/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation

class VipGuest: Entrant {
    init() {
        super.init(entrantType: .vipGuest, canAccessRides: true)
    }
}

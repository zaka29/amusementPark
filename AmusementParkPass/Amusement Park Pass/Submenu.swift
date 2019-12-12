//
//  Submenu.swift
//  Amusement Park Pass
//
//  Created by hamster1 on 6/12/19.
//  Copyright © 2019 hamster1. All rights reserved.
//

import Foundation
import UIKit

enum MenuItems {
    case guest
    case employee
    case contractor
    case manager
    case vendor
}

extension MenuItems {
    var submenu: [String]? {
        switch self {
        case .guest: return ["Child", "Adult", "Senior", "Vip", "Season Pass"]
        case .employee: return ["Food services", "Ride services", "Maintenance"]
        case .contractor: return nil
        case .manager: return nil
        case .vendor: return nil
        }
    }
}

struct Submenu {
    var submenuItems: [String]?
    init(for menuItem: MenuItems) {
        submenuItems = menuItem.submenu
    }
    
    func generateSubmenuItems() -> [UIButton]? {
        var buttons = Array<UIButton>()
        guard let items = submenuItems else {
            return nil
        }
        
        for item in items {
            let button = UIButton(type: .system)
            button.setTitle(item, for: .normal)
            buttons.append(button)
        }
        
        return buttons
    }
    
    func populateSubmenu(with items: [UIButton], for subMenu: UIStackView) {
        
        for item in items {
            subMenu.addArrangedSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
            item.addTarget(self, action: #selector(ViewController.subMenuItemsActionHandler), for: .touchUpInside)
        }
        
        subMenu.distribution = .fillEqually
    }
}


//
//  Menu.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

/// Menu of unordered drinks
class Menu {
    var menuItems: [UnOrderedDrink] = []
    func appendDrink(drink: UnOrderedDrink) {
        menuItems.append(drink)
    }
    
    func menuItemForIndex(index: Int) -> UnOrderedDrink? {
        guard index < menuItems.count && index >= 0 else { return nil }
        return menuItems[index]
    }
}

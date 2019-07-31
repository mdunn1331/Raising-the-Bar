//
//  TabController.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

/// Controller for managing the Tab data (data of drinks already ordered)
class TabController {
    
    static var sharedInstance: TabController = TabController()
    
    var currentDrinks: [OrderedDrink] = []
    
    var tabCount: Int { return currentDrinks.count }
    
    var total: Double {
        var total = 0.0
        for orderedDrink in currentDrinks {
            total += orderedDrink.price
        }
        return total
    }
    
    func orderDrink(drink:  OrderedDrink) {
        currentDrinks.append(drink)
    }
    
    func clearTab() {
        currentDrinks = []
    }
}

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
    
    var total: Double = 0.0
    
    func orderDrink(drink:  OrderedDrink) {
        currentDrinks.append(drink)
        total += drink.price
    }
    
    func clearTab() {
        currentDrinks = []
        total = 0.0
    }
}

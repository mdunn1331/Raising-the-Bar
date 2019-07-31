//
//  OrderedDrink.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

/// Data Model to repsent the drinks already ordered by a customer
class OrderedDrink {
    
    var name: String
    var price: Double
    
    init(drink: UnOrderedDrink) {
        self.name = drink.name
        self.price = drink.price
    }
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

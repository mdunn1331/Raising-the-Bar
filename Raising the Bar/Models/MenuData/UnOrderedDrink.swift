//
//  UnOrderedDrink.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//


/// represents a drink on the menu (yet to be ordered by a customer
class UnOrderedDrink {
    
    var name: String
    var price: Double
    var description: String
    var imageName: String?
    
     init(name: String, price: Double, description: String, imageName: String? = nil) {
        self.name = name
        self.price = price
        self.description = description
        self.imageName = imageName
    }
}

//
//  MenuController.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

/// Controller for accesing the mock menu (unordered drinks)
class MenuController {
    
    //MARK: - Static
    static var sharedInstance: MenuController = MenuController(menu: generateMockMenuData())
    
    class func generateMockMenuData() -> Menu {
        let menu = Menu()

        let ginAndTonic = UnOrderedDrink(name: "Gin & Tonic", price: 9.0, description: "Mix of Gin and Seltzer Water")
        menu.appendDrink(drink: ginAndTonic)
        
        let whiskeySour = UnOrderedDrink(name: "Whiskey Sour", price: 9.0, description: "Sour Mix and Whiskey")
        menu.appendDrink(drink: whiskeySour)
        
        let moscowMule = UnOrderedDrink(name: "Moscow Mule", price: 8.0, description: "Ginger Beer, Lime, Vodka")
        menu.appendDrink(drink: moscowMule)
        
        return menu
    }
    
    //MARK: - Instance
    var menu: Menu
    
    init(menu: Menu) {
        self.menu = menu
    }
}

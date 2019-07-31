//
//  MenuView.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    private var menu = MenuController.sharedInstance.menu
    private var tabController = TabController.sharedInstance
        
    var body: some View {
        VStack {
            Text("Menu & Drinks")
                .font(Font.system(size: 24, design: .default).bold())
                .foregroundColor(Color.white)
                .padding()
//            Path { path in
//                path.move(to: CGPoint(x: -15, y: 50))
//                path.addQuadCurve(to: CGPoint(x: 250, y: 50),
//                                  control: CGPoint(x: 75, y: 0))
//                path.move(to: CGPoint(x: 100, y: 50))
//                path.addQuadCurve(to: CGPoint(x: 500, y: 50),
//                                  control: CGPoint(x: 400, y: -75))
//            }
//                .fill(Color.white)
//                .frame(width: UIScreen.main.bounds.width, height: 40, alignment: .leading)
//                .padding(.all, 0)
            ScrollView {
                ForEach(0..<menu.menuItems.count) { index in
                    HStack {
                        Image("juice")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 92, height: 92, alignment: .center)
                            .overlay(Circle().stroke(Color.customPurple, lineWidth: 4))
                            .padding()
                        VStack(alignment: .leading) {
                            Text("\(self.menu.menuItems[index].name)")
                                .font(Font.system(size:24))
                            Text("\(self.menu.menuItems[index].description)")
                                .font(Font.system(size:16))
                            Text(String(format: "$%.2f", self.menu.menuItems[index].price))
                                .font(Font.system(size:28))

                        }
                        Spacer()
                    }
                        .background(Color.white)
                        .cornerRadius(4)
                        .gesture(
                            TapGesture()
                                .onEnded({
                                    let orderedDrink = OrderedDrink(drink: self.menu.menuItems[index])
                                    self.tabController.currentDrinks.append(orderedDrink)
                                })
                    )
                }
            }
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .background(Color.white)
                
        }
            .padding(.top, 30)
            .background(Color.bluePrupleGradient(start: .topLeading, end: .bottomTrailing))
            .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
#endif

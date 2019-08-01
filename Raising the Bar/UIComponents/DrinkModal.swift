//
//  DrinkModal.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/31/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

import SwiftUI

struct DrinkModal: View {
    
    @State var isPresented: Binding<Bool>
    var menuItem: UnOrderedDrink
    
    var body: some View {
        HStack{
            Spacer()
            VStack {
                Text("Menu & Drinks")
                    .font(Font.system(size: 24, design: .default).bold())
                    .foregroundColor(Color.white)
                    .padding()
                VStack {
                    Text("\(self.menuItem.name)")
                        .font(Font.system(size:26))
                        .padding()
                    
                    Image("juice")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 297, height: 297, alignment: .center)
                        .overlay(Circle().stroke(Color.customPurple, lineWidth: 10))
                        .padding(.all, 16)
                    
                    Text("\(self.menuItem.description)")
                        .font(Font.system(size:18))
                        .padding()
                    
                    Text(String(format: "$%.2f", self.menuItem.price))
                        .font(Font.system(size:30))
                        .padding()
                    VStack {
                        Button(action: {
                            let orderedDrink = OrderedDrink(drink: self.menuItem)
                            TabController.sharedInstance.currentDrinks.append(orderedDrink)
                            self.isPresented.value = false
                        }) {
                            Text("I WANT THIS")
                                .font(Font.system(size: 28))
                                .frame(width: 320, height: 54, alignment: .center)
                                .background(Color.customPurple)
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                            .padding()
                    }
                }
                    .background(Color.white)
                    .padding()
                    .cornerRadius(20)
                Spacer()
            }
            Spacer()
        }
            .background(Color.bluePrupleGradient(start: .topLeading, end: .bottomTrailing))
            .padding(.all, 0)
            .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct DrinkModal_Previews: PreviewProvider {
    static var previews: some View {
        DrinkModal(isPresented: Binding<Bool>.constant(true),
                   menuItem: UnOrderedDrink(name: "Test", price: 0.0, description: "Test"))
    }
}
#endif

//
//  CurrentTabView.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

import SwiftUI

struct CurrentTabView: View {
    
    private var total = TabController.sharedInstance.total
    @State private var currentDrinks = TabController.sharedInstance.currentDrinks
    
    
    var body: some View {
        VStack {
            Text("Current Tab")
                .font(Font.system(size: 24, design: .default).bold())
                .foregroundColor(Color.white)
                .padding()
            VStack {
                VStack(alignment:.leading) {
                    ScrollView {
                        ForEach(0 ..< self.currentDrinks.count) { index in
                           HStack {
                                Text("\(self.currentDrinks[index].name)")
                                Spacer()
                                Text(String(format: "$%.2f", self.currentDrinks[index].price))
                           }
                            .padding(.all, 16)
                            .background(Color.bluePrupleGradient(start: .topLeading, end: .bottomTrailing))
                            .cornerRadius(4)
                            .foregroundColor(Color.white)
                        }
                    }
                    .padding()
                    HStack {
                        Text("Total")
                        Spacer()
                        Text(String(format: "$%.2f", self.total))
                    }
                }
                    .padding(.all, 16)
                Button(action: {
                    TabController.sharedInstance.clearTab()
                    self.currentDrinks = TabController.sharedInstance.currentDrinks
                    
                }) {
                    Text("Checkout")
                        .frame(width: 320, height: 54, alignment: .center)
                        .background(Color.bluePrupleGradient(start: .topLeading, end: .bottomTrailing))
                        .foregroundColor(Color.white)
                        .cornerRadius(100)
                }
                    .padding()
            }
                .background(Color.white)
        }
            .padding(.top, 30)
            .background(Color.bluePrupleGradient(start: .topLeading, end: .bottomTrailing))
            .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct CurrentTabView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTabView()
    }
}
#endif

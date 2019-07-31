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
    
    @State private var presentItemModal = false
    @State private var itemPresentationIndex = 0
    
    private var itemModal: some View {
        DrinkModal(isPresented: self.$presentItemModal, menuItem: menu.menuItems[self.itemPresentationIndex])
    }
        
    var body: some View {
        VStack {
            Text("Menu & Drinks")
                .font(Font.system(size: 24, design: .default).bold())
                .foregroundColor(Color.white)
                .padding()

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
                                    self.presentItemModal = true
                                    self.itemPresentationIndex = index
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
            .sheet(isPresented: self.$presentItemModal, onDismiss: { self.presentItemModal = false }, content: {
                self.itemModal
            })
    }
}

#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
#endif

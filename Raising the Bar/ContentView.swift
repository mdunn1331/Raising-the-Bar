//
//  ContentView.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var selection = 0
    
//    init() {
//        UIScrollView.appearance().direc
//    }
        
    var body: some View {
        TabbedView(selection: $selection){
            AccountView()
                .tabItem {
                    VStack {
                        Image("business-contact")
                        Text("My Account")
                    }
                        .padding()
                }
                .tag(0)
            MenuView()
                .tabItem {
                    VStack {
                        Image("juice")
                        Text("Menu & Drinks")
                    }
                        .padding()
                }
                .tag(1)
            CurrentTabView()
                .tabItem {
                    VStack {
                        Image("name-card")
                        Text("Tab")
                    }
                        .padding()
                }
                .tag(2)
        }
            .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

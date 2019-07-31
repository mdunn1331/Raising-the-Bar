//
//  AccountView.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    
    @State private var isPresented = false
    @State private var cardText = "XXXX-1111"
    @State private var cardName = "Michael Dunn"
    
    private var accountHeader: some View {
        VStack {
            Image("oreoAccount")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 6))
                .frame(width: 132, height: 132, alignment: .center)
                .padding(.bottom, 12)
            Text(self.cardName)
                .font(Font.system(size: 24, design: .default))
                .foregroundColor(Color.white)
        }
    }
    
    private var birthday: some View {
        VStack {
            Text("BIRTHDATE")
                .font(Font.system(size: 18, design: .default))
                .fontWeight(.light)
                .padding(.bottom, 2)
            Text("2/10/2019")
                .font(Font.system(size:30, design: .default))
                .fontWeight(.medium)
        }
    }
    
    private var creditCardInfo: some View {
        VStack {
            Text("SAVED CARD")
                .font(Font.system(size: 18, design: .default))
                .fontWeight(.light)
                .padding(.bottom, 2)
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Platinum Card")
                            .font(Font.system(size:17)).bold()
                        Spacer()
                        Text("NCR")
                            .font(Font.system(size:15))
                            .padding(.trailing, -6)
                        Text("BANK")
                            .font(Font.system(size:15)).bold()
                    }
                        .padding(.bottom, 0)
                    Image("visa")
                        .padding(.bottom, 56)
                    HStack {
                        Text(self.cardText)
                            .font(Font.system(size:15))
                        Spacer()
                        Text(self.cardName)
                            .font(Font.system(size:20))
                    }
                }
                    .padding(.all, 20)
                    .foregroundColor(Color.white)
                    .background(Color.bluePrupleGradient(start: .topLeading, end: .bottomTrailing))
            }
                .cornerRadius(8)
                .padding([.leading, .trailing], 16)
        }
    }
    
    var changeCardView: some View {
        HStack {
            Spacer()
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(Color.customPurple)
                    Image("i-add")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .scaledToFit()
                }
                    .padding(.bottom, 2)
                Text("Change My Card")
                    .font(Font.system(size:16))
                    .fontWeight(.semibold)
            }
                .padding()
            Spacer()
        }
        .gesture(TapGesture().onEnded{
            self.isPresented = true
        })
            .border(Color.gray.opacity(0.15), width: 2, cornerRadius: 8)
    }
    
    private var cardChangeModal: some View {
        ChangeCardModal(isPresented: self.$isPresented,
                        cardText: self.$cardText,
                        cardName: self.$cardName)
    }
    
    var body: some View {
        VStack {
            Text("My Account")
                .font(Font.system(size: 24, design: .default).bold())
                .foregroundColor(Color.white)
                .padding()
            VStack {
                accountHeader
                    .padding()
                VStack {
                    birthday
                        .padding()
                    creditCardInfo
                        .padding()
                    changeCardView
                        .padding([.leading, .trailing], 24)
                        .padding([.bottom, .top], 2)
                    Spacer()
                }
                    .background(Color.white)
            }
                .background(Color.clear)
        }
            .padding(.top, 50)
            .background(Color.bluePrupleGradient(start: .topLeading, end: .bottomTrailing))
            .edgesIgnoringSafeArea(.top)
            .sheet(isPresented: $isPresented, onDismiss: { self.isPresented = false }, content: {
                self.cardChangeModal
            })
    }
}

#if DEBUG
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
#endif

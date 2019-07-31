//
//  ChangeCardModal.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/30/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

import SwiftUI

struct ChangeCardModal: View {
    
    @State var isPresented: Binding<Bool>
    @State var cardText: Binding<String>
    @State var cardName: Binding<String>
    
    @State private var newCardText: String = ""
    @State private var name: String = ""

    @State private var expirationDate: String = ""
    @State private var securityCode: String = ""


    var body: some View {
        VStack {
            Spacer()
            VStack {
                VStack {
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.all, 0)
                        .border(Color.customPurple, width: 3, cornerRadius: 8)
                }
                    .padding()

                VStack {
                    TextField("Card Number", text: $newCardText)
                        .textFieldStyle(.roundedBorder)
                        .padding(.all, 0)
                        .border(Color.customPurple, width: 3, cornerRadius: 8)
                }
                    .padding()

                HStack {
                    TextField("Exp. Date", text: $expirationDate)
                        .textFieldStyle(.roundedBorder)
                        .padding(.trailing, 6)
                        .border(Color.customPurple, width: 3, cornerRadius: 8)
                    
                    TextField("Security Code", text: $securityCode)
                        .textFieldStyle(.roundedBorder)
                        .padding(.all, 0)
                        .border(Color.customPurple, width: 3, cornerRadius: 8)
                }
                    .padding()
                
                VStack {
                    Button(action: {
                        if self.newCardText.count > 4 {
                            let subString = self.newCardText.suffix(4)
                            let maskedCard = "XXXX-\(subString)"
                            self.cardText.value = maskedCard
                        }
                
                        self.dismiss()
                    }) {
                        Text("Confirm")
                            .font(Font.system(size: 28))
                            .frame(width: 320, height: 54, alignment: .center)
                            .background(Color.customPurple)
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                    }
                }
                    .padding()
            }
                .background(Color.customGrey)
//                .cornerRadius(8)
                .padding()
            Spacer()
        }
            .background(Color.bluePrupleGradient(start: .topLeading, end: .bottomTrailing))
            .edgesIgnoringSafeArea(.bottom)
    }
    
    func dismiss() {
        self.isPresented.value = false
    }
}

#if DEBUG
struct ChangeCardModal_Previews: PreviewProvider {
    static var previews: some View {
        ChangeCardModal(isPresented: Binding<Bool>.constant(true),
                        cardText:Binding<String>.constant("Testing"),
                        cardName:Binding<String>.constant("Testing"))
    }
}
#endif

//
//  FullImageScreen.swift
//  SandStromTest
//
//  Created by Evgeniy Lemish on 09.09.2023.
//

import SwiftUI

struct FullImageScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle")
                        .clipShape(Circle())
                        .font(.title)
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                        .cornerRadius(90)
                }
                .padding()
            }
            ScrollView(.horizontal, showsIndicators: false)  {
                Image("panda")
                    .scaledToFill()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}







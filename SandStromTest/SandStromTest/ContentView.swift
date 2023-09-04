//
//  ContentView.swift
//  SandStromTest
//
//  Created by Evgeniy Lemish on 02.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 300) {
            VStack(spacing: 8) {
                Image("panda")
                    .frame(width: 150, height: 250, alignment: .center)
                    .clipped()
                
                
                HStack(spacing: 20) {
                    Button("Lock"){
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(18)
                    
                    Button("Open from top"){
                    }
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(18)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
            }
            .padding()
            
            Button("Open full"){
            }
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(18)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

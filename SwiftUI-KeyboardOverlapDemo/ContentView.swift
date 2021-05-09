//
//  ContentView.swift
//  SwiftUI-KeyboardOverlapDemo
//
//  Created by Russell Archer on 02/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        ScrollView {
            
            Color.red
                .overlay(Text("Height = 610 (fixed)\nKeyboard height = \(viewModel.keyboardHeight)"))
                .frame(height: 610)  // Fixed
            
            Spacer()
            
            HStack {
                Text("Username:").frame(width: 100, height: 35, alignment: .leading)
                TextField("enter username", text: $username)
            }
            
            HStack {
                Text("Password:").frame(width: 100, height: 35, alignment: .leading)
                SecureField("enter password", text: $password)
            }
            
            HStack {
                
                Button(action: {
                    
                    print("Username = \(username)")
                    print("Password = \(password)")
                    
                }, label: {
                    Text("Submit")
                        .font(.title)
                        .frame(width: 250, height: 75, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding()
                })
            }.frame(maxWidth: .infinity)
        }
        .padding(.bottom, CGFloat(viewModel.keyboardHeight))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Bulls Eye
//
//  Created by BRYTA on 27/04/2020.
//  Copyright © 2020 BRYTA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var whoIsThereIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, BRYTA!")
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Click me"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) {
                () -> Alert in
                return Alert(title: Text("Hello from BRYTA"), message: Text("Making an alert"), dismissButton: .default(Text("Awesome")))
            }
            Button(action: {
                self.whoIsThereIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Knock, knock"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $whoIsThereIsVisible) {
                () -> Alert in
                return Alert(title: Text("Who goes there?"), message: Text("It's Ryta"), dismissButton: .default(Text("Great")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

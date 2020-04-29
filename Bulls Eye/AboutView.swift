//
//  AboutView.swift
//  Bulls Eye
//
//  Created by BRYTA on 28/04/2020.
//  Copyright © 2020 BRYTA. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let mintColor = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    
    struct HeaderStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
        }
    }
    
    struct BodyStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .padding(.init(top: 0, leading: 60, bottom: 20, trailing: 60))
        }
    }
    
    var body: some View {
        Group {
        VStack {
            Text("🎯 BullsEye 🎯").modifier(HeaderStyle())
            Text("This is Bull's Eye, the game where you win points and get fame by dragging slider")
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(BodyStyle())
            Text("Built by Abiodun Sulaiman. Enjoy!").modifier(BodyStyle())
            
        }
    .background(mintColor)
    .navigationBarTitle("About BullsEye")
    }
    .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(
            .fixed(width: 896, height: 414)
        )
    }
}

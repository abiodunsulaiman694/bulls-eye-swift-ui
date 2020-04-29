//
//  AboutView.swift
//  Bulls Eye
//
//  Created by BRYTA on 28/04/2020.
//  Copyright © 2020 BRYTA. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("🎯 BullsEye 🎯")
            Text("This is Bull's Eye, the game where you win points and get fame by dragging slider")
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.")
            Text("Built by Abiodun Sulaiman. Enjoy!")
            
        }
    .navigationBarTitle("About BullsEye")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(
            .fixed(width: 896, height: 414)
        )
    }
}

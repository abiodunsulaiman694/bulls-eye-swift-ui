//
//  ContentView.swift
//  Bulls Eye
//
//  Created by BRYTA on 27/04/2020.
//  Copyright © 2020 BRYTA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        VStack {
            //Target row
            Spacer()
            HStack {
                Text("Put the bull's eye as close as you can to:")
                Text("\(self.target)")
            }
            Spacer()
            //slider row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            
            //button row
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Click me"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) {
                () -> Alert in
                return Alert(title: Text("\(alertTitle())"), message: Text("The slider's value is \(roundSliderValue()).\n" +
                    "You scored \(pointsForCurrentRound()) points this round"), dismissButton: .default(Text("Awesome")) {
                        self.score = self.score + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                    })
            }
            Spacer()
            
            //score row
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score")
                Text("\(score)")
                Spacer()
                Text("Round")
                Text("\(round)")
                Spacer()
                Button(action: {}) {
                    Text("info")
                }
                
            }
            .padding(.bottom, 20)
        }
    }
    
    func resetGame() -> Void {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
    func roundSliderValue() -> Int {
        Int(sliderValue.rounded())
    }
    
    func getDifference() -> Int {
        abs(target - roundSliderValue())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = 100 - getDifference()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - (difference + bonus)
    }
    
    func alertTitle() -> String {
        let title: String
        if getDifference() == 0 {
            title = "Perfect!"
        } else if getDifference() < 5 {
            title = "Almost there!"
        } else if getDifference() <= 10 {
            title = "Not bad"
        } else {
            title = "Are you even trying?"
        }
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(
            .fixed(width: 896, height: 414)
        )
    }
}

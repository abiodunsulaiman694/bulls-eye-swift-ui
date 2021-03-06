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
    
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .modifier(Shadow())
            .foregroundColor(Color.white)
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .modifier(Shadow())
                .foregroundColor(Color.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct LargeButtonTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct SmallButtonTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    var body: some View {
        VStack {
            //Target row
            Spacer()
            HStack {
                Text("Put the bull's eye as close as you can to:").modifier(LabelStyle())
                Text("\(self.target)").modifier(ValueStyle())
            }
            Spacer()
            //slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            
            //button row
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Get Score").modifier(LargeButtonTextStyle())
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
            .background(Image("Button"))
            Spacer()
            
            //score row
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start Over").modifier(SmallButtonTextStyle())
                        
                    }
                }
                .background(Image("Button"))
                Spacer()
                Text("Score").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("info").modifier(SmallButtonTextStyle())
                        
                    }
                }
                .background(Image("Button"))
                
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center).modifier(Shadow())
    .accentColor(midnightBlue)
    .navigationBarTitle("BullsEye")
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
        let bonus: Int
        if getDifference() == 0 {
            bonus = 100
        } else if getDifference() == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return (maximumScore - getDifference()) + bonus
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

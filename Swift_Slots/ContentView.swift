//
//  ContentView.swift
//  Swift_Slots
//
//  Created by Zach Mommaerts on 3/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var credits = 1000
    private var slotImages = ["apple", "cherry", "star"]
    @State private var slot1 = "apple"
    @State private var slot2 = "apple"
    @State private var slot3 = "apple"
    
    func handleButton(){
        credits -= 5
        
        let rand1 = Int.random(in: 0...2)
        let rand2 = Int.random(in: 0...2)
        let rand3 = Int.random(in: 0...2)
        
        slot1 = slotImages[rand1]
        slot2 = slotImages[rand2]
        slot3 = slotImages[rand3]
        
        if(rand1 == rand2 && rand2 == rand3){
            credits += 50
        }
    }
    
    var body: some View {
        VStack {
            Text("SwiftUI Slots!")
                .font(.title)
            
            Spacer()
            
            Text("Credits: " + String(credits))
            
            Spacer()
            
            HStack{
                Image(slot1)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                Image(slot2)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                Image(slot3)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
            }
            
            Spacer()
            
            Button(action: {
                handleButton()
            }, label: {
                Text("Spin")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 50.0)
                    .padding(.vertical,
                             10.0)
            })
                .foregroundColor(Color.white)
                .background(Color.pink)
                .cornerRadius(50)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

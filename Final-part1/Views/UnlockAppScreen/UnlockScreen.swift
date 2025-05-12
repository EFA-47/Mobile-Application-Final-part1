//
//  UnlockScreen.swift
//  Final-part1
//
//  Created by Emir Fatih AYYILDIZ on 22.01.2024.
//
import SwiftUI

struct UnlockScreen: View {
    @State private var card1 = Int.random(in: 1...10)
    @State private var card2 = Int.random(in: 1...10)
    @State private var card3 = Int.random(in: 1...10)

    @GestureState var locationState1 = CGPoint(x: 100, y: 100)
    @GestureState var locationState2 = CGPoint(x: 100, y: 250)
    @GestureState var locationState3 = CGPoint(x: 100, y: 400)

    @State var location1 = CGPoint(x: 100, y: 100)
    @State var location2 = CGPoint(x: 100, y: 250)
    @State var location3 = CGPoint(x: 100, y: 400)

    var body: some View {
        NavigationStack{
            
            
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .overlay(Text("\(card1)").foregroundColor(.white).font(.system(size: 14)))
                    .position(location1)
                    .gesture(
                        DragGesture()
                            .onChanged{state in
                                location1 = state.location}
                            .updating(
                                $locationState1
                            ) {
                                currentState, pastLocation,transaction in
                                pastLocation = currentState.location
                                transaction.animation = .easeInOut
                            }
                    )
                
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .overlay(Text("\(card2)").foregroundColor(.white).font(.system(size: 14)))
                    .position(location2)
                    .gesture(
                        DragGesture()
                            .onChanged{state in
                                location2 = state.location}
                            .updating(
                                $locationState2
                            ) {
                                currentState, pastLocation,transaction in
                                pastLocation = currentState.location
                                transaction.animation = .easeInOut
                            }
                    )
                
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .overlay(Text("\(card3)").foregroundColor(.white).font(.system(size: 14)))
                    .position(location3)
                    .gesture(
                        DragGesture()
                            .onChanged{state in
                                location3 = state.location}
                            .updating(
                                $locationState3
                            ) {
                                currentState, pastLocation,transaction in
                                pastLocation = currentState.location
                                transaction.animation = .easeInOut
                            }
                    )
                
                
                
                
                
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: RegionListView()) {
                        LinkText(text: "Continue")
                    }
                }
            }
        }
    }
    func saveCardLocations() {
        UserDefaults.standard.set(location1, forKey: "Card1Location")
        UserDefaults.standard.set(location2, forKey: "Card2Location")
        UserDefaults.standard.set(location3, forKey: "Card3Location")
    }
}

#Preview {
    UnlockScreen()
        .preferredColorScheme(.dark)
}

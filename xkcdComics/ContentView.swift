//
//  ContentView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 06/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Image("1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 500)
                        .navigationTitle("xkcdComics")
                        .overlay(
                            VStack {
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        showingSheet.toggle()
                                    }) {
                                        Image(systemName: "info.circle")
                                            .sheet(isPresented: $showingSheet) {
                                                SheetView()
                                            }
                                    }
                                    .font(.title2)
                                    .padding(10)
                                }
                                
                                Spacer()
                            }
                        )
                }
                HStack{
                    Button(action: {
                        print("Previous button tapped!")
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .tint(.blue)
                    .font(.largeTitle)
                    
                    Button(action: {
                        print("Favourite button tapped!")
                    }) {
                        Image(systemName: "heart")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .tint(.red)
                    .font(.largeTitle)
                    Button(action: {
                        print("Next button tapped!")
                    }) {
                        Image(systemName: "chevron.right")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .tint(.green)
                    .font(.largeTitle)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

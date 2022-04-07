//
//  ContentView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 06/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                Image("testComic")
                    .resizable()
                    .frame(maxWidth: 500)
                    .navigationTitle("xkcdComics")
                
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
            .preferredColorScheme(.light)
    }
}

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
            TabView{
                ComicView()
                    .tabItem {
                        Label("Comics", systemImage: "newspaper")
                    }
                FavouriteView()
                    .tabItem {
                        Label("Favourites", systemImage: "heart")
                    }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13 Pro")
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .previewDevice("iPad mini (6th generation)")
                .previewInterfaceOrientation(.portrait)
        }
        
    }
}

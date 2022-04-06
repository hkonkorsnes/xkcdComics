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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

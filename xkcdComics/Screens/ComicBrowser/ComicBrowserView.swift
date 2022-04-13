//
//  ComicBrowserView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 06/04/2022.
//

import SwiftUI

struct ComicBrowserView: View {
    @State private var showingSheet = false
    @State var comic: Comic?
    @State var newestComicNumber: Int = 1
    @State var currentComicNumber: Int = 1
    @State private var comicNumber: String = ""
    @FocusState private var searchFocus: Bool
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        VStack{
            
            SearchBar()
            
            TopComicBar(comic: $comic, newestComicNumber: $newestComicNumber, currentComicNumber: $currentComicNumber)
            
            Spacer()
            
            ComicImage(comic: $comic, newestComicNumber: $newestComicNumber, currentComicNumber: $currentComicNumber)
            
            Spacer()
            
            BotttomButtons(comic: $comic, newestComicNumber: $newestComicNumber, currentComicNumber: $currentComicNumber)
        }
        .navigationTitle("xkcdComics")
    }
}

struct ComicBrowserView_Previews: PreviewProvider {
    static var previews: some View {
            ComicBrowserView()
                .previewDevice("iPhone 13 Pro")
                .previewInterfaceOrientation(.portrait)
    }
}



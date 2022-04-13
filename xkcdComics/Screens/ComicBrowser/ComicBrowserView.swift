//
//  ComicBrowserView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 06/04/2022.
//

import SwiftUI

struct ComicBrowserView: View {

    @State private var comic: Comic?
    @State private var newestComicNumber: Int = 1
    @State private var currentComicNumber: Int = 1
    
    var body: some View {
        VStack{
            
            ComicInfoBar(comic: $comic, currentComicNumber: $currentComicNumber)
            
            Spacer()
            
            AsyncImage(url: comic?.img) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
//                } else if phase.error != nil {
//                    Text("There was an error loading the image.")
//                }
                } else {
                    ProgressView()
                }
            }
            
            Spacer()
            
            BottomButtonsView(comic: $comic, newestComicNumber: $newestComicNumber, currentComicNumber: $currentComicNumber)
        }
        .navigationTitle("xkcdComics")
        .onAppear {
            getLatestComic()
        }
    }
    
    private func getLatestComic() {
        Task {
            do {
                let newestComic = try await APIManager.shared.getLatestComic()
                self.comic = newestComic
                self.newestComicNumber = newestComic.num
                self.currentComicNumber = newestComicNumber
            } catch {
                print("Request failed with error: \(APIError.invalidResponse)")
            }
        }
    }
}

struct ComicBrowserView_Previews: PreviewProvider {
    static var previews: some View {
        ComicBrowserView()
            .previewDevice("iPhone 13 Pro")
            .previewInterfaceOrientation(.portrait)
    }
}



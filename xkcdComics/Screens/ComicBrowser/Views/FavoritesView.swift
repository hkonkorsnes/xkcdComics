//
//  FavoritesView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 20/04/2022.
//

import SwiftUI

struct FavoritesView: View {
    
    
    var body: some View {
        
        // TODO: Make this work in the future.
        // List of Favorites
        NavigationView {
            VStack {
                VStack {
                    List() {
                        // Placeholder favorite
                        HStack {
                            Image("comicPlaceholder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100.0)
                            
                            Text("Placeholder Favorite")
                                .fontWeight(.bold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.75)
                            
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.red)
                                .padding()
                        }
                        .frame( height: 100.0)
                        
                        // Second placeholder favorite
                        HStack {
                            Image("comicPlaceholder2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100.0)
                            
                            Text("Placeholder Favorite")
                                .fontWeight(.bold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.75)
                            
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.red)
                                .padding()
                        }
                        .frame( height: 100.0)
                        
                    }
                }
            }
            .navigationTitle("Favorites")
        }
        
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

//
//  TopComicBar.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 13/04/2022.
//

import SwiftUI

struct ComicInfoBar: View {
    
    @State private var showingSheet = false
    @Binding var comic: Comic?
    @Binding var newestComicNumber: Int
    @Binding var currentComicNumber: Int
    
    var body: some View {
        HStack {
            if currentComicNumber == newestComicNumber {
                Text("Comic Number: #\(currentComicNumber)")
                    .font(.headline)
            } else {
                Text("Comic Number: #\(currentComicNumber)")
                    .font(.headline)
            }
            Spacer()
            
            Button(action: {
                showingSheet.toggle()
            }) {
                Image(systemName: "info.circle")
                    .sheet(isPresented: $showingSheet) {
                        ComicInfoView(comic: comic)
                    }
            }
            .frame(width: 44, height: 44)
            .font(.title2)
        }
        .padding(.horizontal)
    }
}

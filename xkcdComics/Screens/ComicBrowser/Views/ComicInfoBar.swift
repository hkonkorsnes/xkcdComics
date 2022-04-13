//
//  ComicInfoBar.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 13/04/2022.
//

import SwiftUI

// This view contains the current comic number, and an info button to present more info about the comic.
struct ComicInfoBar: View {
    
    @State private var showingSheet = false
    @Binding var comic: Comic?
    @Binding var currentComicNumber: Int
    
    var body: some View {
        HStack {
            Text("Comic Number: #\(currentComicNumber)")
                .font(.headline)

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

struct ComicInfoBar_Previews: PreviewProvider {
    static var previews: some View {
        ComicInfoBar(comic: .constant(nil), currentComicNumber: .constant(1234))
            .previewLayout(.sizeThatFits)
    }
}


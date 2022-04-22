//
//  ComicInfoView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 07/04/2022.
//

import SwiftUI

// A screen showing details about a selected Comic
struct ComicInfoView: View {
    var comic: Comic?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            // TopBar
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "x.circle")
                        .font(.title2)
                }
                .frame(width: 44, height: 44)
                .padding(10)
                Spacer()
            }
            
            // Info cells
            VStack(alignment: .leading, spacing: 16) {
                if let comicTitle = comic?.title {
                    InfoCell(titleText: "Title", value: comicTitle)
                }
                
                if let comicNumber = comic?.num {
                    InfoCell(titleText: "Number", value: "#\(comicNumber)")
                }
                
                if let day = comic?.day, let month = comic?.month, let year = comic?.year {
                    InfoCell(titleText: "Release date", value: "\(day).\(month).\(year)")
                }
                
                if let comicTranscript = comic?.transcript {
                    InfoCell(titleText: "Transcript", value: comicTranscript)
                }
            }
            
            // To push the content up
            Spacer()
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        let comic = Comic.init(
            month: "02",
            num: 1234,
            link: "https://dummylink.com",
            year: "2022",
            news: "",
            safeTitle: "",
            transcript: "",
            alt: "Some alt here",
            img: URL(string: "https://imgs.xkcd.com/comics/frankenstein_captcha.png")!,
            title: "The title",
            day: "24"
        )
        
        ComicInfoView(comic: comic)
    }
}

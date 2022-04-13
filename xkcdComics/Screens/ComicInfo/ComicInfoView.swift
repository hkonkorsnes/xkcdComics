//
//  SheetView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 07/04/2022.
//

import SwiftUI

struct ComicInfoView: View {
    var comic: Comic?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack{
                
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
                }
                
                Spacer()
            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        ComicInfoView()
    }
}

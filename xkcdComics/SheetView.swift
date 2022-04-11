//
//  SheetView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 07/04/2022.
//

import SwiftUI

struct SheetView: View {
    
    var comic: Comic?
    
    var body: some View {
        ZStack {
            VStack{
                TopBar()
                InfoView(comic: comic)
                Spacer()
            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}

struct TopBar: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack{
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
    }
}

struct InfoView: View {
    var comic: Comic?
    
    var body: some View {
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
    }
}

struct InfoCell: View {
    
    var titleText: String
    var value: String
    
    var body: some View {
        VStack {
            HStack {
                Text(titleText)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                Spacer()
                Text(value)
                    .foregroundColor(.primary)
                    .font(.subheadline)
            }
            Rectangle()
                .frame(width: nil, height: 1)
                .foregroundColor(.secondary)
                .opacity(0.5)
        }
        .padding(.horizontal)
    }
}

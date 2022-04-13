//
//  InfoCell.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 13/04/2022.
//

import SwiftUI

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

struct InfoCell_Previews: PreviewProvider {
    static var previews: some View {
        InfoCell(titleText: "Title", value: "Value")
            .previewLayout(.sizeThatFits)
    }
}

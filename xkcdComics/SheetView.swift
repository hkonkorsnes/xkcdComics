//
//  SheetView.swift
//  xkcdComics
//
//  Created by Louise Ellefsen on 07/04/2022.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "x.circle")
                            .font(.title2)
                            .padding(10)
                    }
                    Spacer()
                }
                Spacer()
            }
            Text("Comic info")
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}

//
//  ComicView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 06/04/2022.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var num: Int
    var safe_title: String
    var img: String
}

struct ComicView: View {
    
    @State private var results = [Result]()
    @State private var showingSheet = false
    @State var input = ""
    
    var body: some View {
            VStack{
                
                ZStack{
                    //                    List(results, id: \.num) { item in
                    //                        VStack(alignment: .leading) {
                    //                            Text(item.safe_title)
                    //                                .font(.headline)
                    //                            Text(item.img)
                    //                        }
                    //                    }
                    //                    .task {
                    //                        await loadData()
                    //                    }
                    AsyncImage(url: URL(string: "https://imgs.xkcd.com/comics/barrel_cropped_(1).jpg")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Text("There was an error loading the image.")
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(width: 400, height: 300)
                    
                    
                    
                    
                    
                    
                    .navigationTitle("xkcdComics")
                    .overlay(
                        
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    showingSheet.toggle()
                                }) {
                                    Image(systemName: "info.circle")
                                        .sheet(isPresented: $showingSheet) {
                                            SheetView()
                                        }
                                }
                                .font(.title2)
                                .padding(10)
                            }
                            
                            Spacer()
                        }
                    )
                }
                HStack{
                    Button(action: {
                        print("Previous button tapped!")
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .tint(.blue)
                    .font(.largeTitle)
                    
                    Button(action: {
                        print("Favourite button tapped!")
                    }) {
                        Image(systemName: "heart")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .tint(.red)
                    .font(.largeTitle)
                    Button(action: {
                        print("Next button tapped!")
                    }) {
                        Image(systemName: "chevron.right")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .tint(.green)
                    .font(.largeTitle)
                }
            }
    }
    func loadData() async {
        guard let url = URL(string: "https://xkcd.com/info.0.json")
        else{
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("invalid data")
        }
    }
}

struct ComicView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13 Pro")
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .previewDevice("iPad mini (6th generation)")
                .previewInterfaceOrientation(.portrait)
        }
        
    }
}

//
//  ComicView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 06/04/2022.
//

import SwiftUI

struct ComicView: View {
    @State private var showingSheet = false
    @State var comic: Comic?
    @State var newestComicNumber: Int = 1
    @State var currentComicNumber: Int = 1
    
    var body: some View {
        VStack{
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
                            SheetView(comic: comic)
                        }
                }
                .frame(width: 44, height: 44)
                .font(.title2)
            }
            .padding(.horizontal)
            Spacer()
            
            ZStack{
                AsyncImage(url: comic?.img) { phase in
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
            }
            
            Spacer()
            
            HStack{
                Button(action: {
                    guard currentComicNumber > 1 else { return }
                    currentComicNumber -= 1
                    Task {
                        do {
                            self.comic = try await APIManager.shared.getComic(for: currentComicNumber)
                        } catch {
                            print("Request failed with error: \(APIError.invalidResponse)")
                        }
                    }
                }) {
                    Image(systemName: "chevron.left")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .tint(.blue)
                .font(.largeTitle)
                .disabled(currentComicNumber == 1)
                
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
                    guard currentComicNumber < newestComicNumber else { return }
                    currentComicNumber += 1
                    Task {
                        do {
                            self.comic = try await APIManager.shared.getComic(for: currentComicNumber)
                        } catch {
                            print("Request failed with error: \(APIError.invalidResponse)")
                        }
                    }
                }) {
                    Image(systemName: "chevron.right")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .tint(.green)
                .font(.largeTitle)
                .disabled(currentComicNumber == newestComicNumber)
            }
        }
        
        .navigationTitle("xkcdComics")
        .onAppear {
            Task {
                do {
                    let newestComic = try await APIManager.shared.getCurrentComic()
                    self.comic = newestComic
                    self.newestComicNumber = newestComic.num
                    self.currentComicNumber = newestComicNumber
                } catch {
                    print("Request failed with error: \(APIError.invalidResponse)")
                }
            }
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

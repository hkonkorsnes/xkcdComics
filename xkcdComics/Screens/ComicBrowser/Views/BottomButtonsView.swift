//
//  BottomButtonsView.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 12/04/2022.
//


import SwiftUI

// This view contains three buttons.
// One for showing previous comic
// One for adding current comic to favorites
// One for showing next comic
struct BottomButtonsView: View {

    @Binding var comic: Comic?
    @Binding var newestComicNumber: Int
    @Binding var currentComicNumber: Int
    @State private var errorMessage: String?
    @State var isFavorite : Bool = false

    var body: some View {
        HStack {
            // Previous button
            Button(action: {
                guard currentComicNumber < newestComicNumber else { return }
                currentComicNumber += 1
                getComic()
                isFavorite = false
                
            }) {
                Image(systemName: "chevron.left")
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .tint(.blue)
            .font(.largeTitle)
            .disabled(currentComicNumber == newestComicNumber)
            
            // Favorite button
            Button(action: {
                self.isFavorite.toggle()
            }) {
                Image(systemName: self.isFavorite == true ? "heart.fill" : "heart")
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .tint(.red)
            .font(.largeTitle)
            
            // Next button
            Button(action: {
                guard currentComicNumber > 1 else { return }
                currentComicNumber -= 1
                getComic()
                isFavorite = false
            }) {
                Image(systemName: "chevron.right")
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .tint(.green)
            .font(.largeTitle)
            .disabled(currentComicNumber == 1)
        }
        .padding()
        .alert("Error", isPresented: .constant(errorMessage != nil)) {
            Button("OK", role: .cancel) {
                errorMessage = nil
            }
        } message: {
            Text(errorMessage ?? "Something went wrong")
        }
    }
    
    private func getComic() {
        Task {
            do {
                self.comic = try await APIManager.shared.getComic(for: currentComicNumber)
            } catch(let error) {
                if let apiError = error as? APIError {
                    errorMessage = apiError.errorDescription()
                } else {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}

struct BottomButtons_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView(comic: .constant(nil), newestComicNumber: .constant(44), currentComicNumber: .constant(32))
            .previewLayout(.sizeThatFits)
    }
}

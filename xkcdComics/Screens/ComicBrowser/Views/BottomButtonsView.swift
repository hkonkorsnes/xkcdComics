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

    var body: some View {
        HStack {
            // Previous button
            Button(action: {
                guard currentComicNumber < newestComicNumber else { return }
                currentComicNumber += 1
                getComic()
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
                print("Favorite button tapped!")
            }) {
                Image(systemName: "heart")
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
    }
    
    private func getComic() {
        Task {
            do {
                self.comic = try await APIManager.shared.getComic(for: currentComicNumber)
            } catch {
                print("Request failed with error: \(APIError.invalidResponse)")
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

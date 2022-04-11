//
//  APIManager.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 11/04/2022.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case unknownError(error: Error)
    case invalidResponse
    case invalidData
    case parsingError
    
    func errorDescription() -> String {
        switch self {
            
        case .invalidURL:
            return "The URL vas invalid"
        case .unknownError(error: let error):
            return "Unknown error occured \(error.localizedDescription)"
        case .invalidResponse:
            return "The response was invalid"
        case .invalidData:
            return "Invalid data"
        case .parsingError:
            return "Unable to parse data"
        }
    }
}

class APIManager {
    
    static let shared = APIManager()

    
    func getCurrentComic() async throws -> Comic {
        guard let url = URL(string: "https://xkcd.com/info.0.json") else {
            print("Invalid URL")
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
            
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let decodedResponse = try? decoder.decode(Comic.self, from: data) else {
            throw APIError.parsingError
        }
        
        return decodedResponse
    }
    
    func getComic(for number: Int) async throws -> Comic {        
        let urlString = "https://xkcd.com/\(number)/info.0.json"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
            
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let decodedResponse = try? decoder.decode(Comic.self, from: data) else {
            throw APIError.parsingError
        }
        
        return decodedResponse
    }
}

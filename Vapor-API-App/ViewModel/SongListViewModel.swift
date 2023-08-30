//
//  SongListViewModel.swift
//  Vapor-API-App
//
//  Created by Waldyr Schneider on 29/08/23.
//

import Foundation

class SongListViewModel: ObservableObject {
    @Published var songs: [Song] = []
    
    func fetchSongs() async throws {
        let urlString = Constants.baseUrl + Endpoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let songResponse: [Song] = try await HttpClient.shared.fetch(url: url)
        
        
        DispatchQueue.main.async {
            self.songs = songResponse
        }
    }
}

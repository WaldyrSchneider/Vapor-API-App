//
//  AddUpdateViewModel.swift
//  Vapor-API-App
//
//  Created by Waldyr Schneider on 30/08/23.
//

import Foundation

final class AddUpdateViewModel: ObservableObject {
    @Published var songTitle: String = ""
    
    var songID: UUID?
    
    var isUpdating: Bool {
        songID != nil
    }
    
    var buttonTitle: String {
        songID != nil ? "Update Song" : "Add Song"
    }
    
    init() {}
    
    init(currentSong: Song) {
        self.songTitle = currentSong.title
        self.songID = currentSong.id
    }
    
    func addSong() async throws {
        let urlString = Constants.baseUrl + Endpoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let song = Song(id: nil, title: self.songTitle)
        
        try await HttpClient.shared.sendData(url: url, object: song, httpMethod: HttpMethods.POST.rawValue)
    }
    
    func addUpdateSong(completion: @escaping () -> Void) {
        Task {
            do {
                if isUpdating {
                    try await self.updateSong()
                } else {
                    try await addSong()
                }
            } catch {
                print("error: \(error)")
            }
            completion()
        }
    }
    
    func updateSong() async throws {
        let urlString = Constants.baseUrl + Endpoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let songToUpdate = Song(id: self.songID, title: self.songTitle)
        try await HttpClient.shared.sendData(url: url, object: songToUpdate, httpMethod: HttpMethods.PUT.rawValue)
    }
}

//
//  SongList.swift
//  Vapor-API-App
//
//  Created by Waldyr Schneider on 29/08/23.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var songListViewModel: SongListViewModel = SongListViewModel()
    
    @State var modal: ModalType? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(songListViewModel.songs) {
                    song in
                    Button {
                        modal = .update(song)
                    } label: {
                        Text(song.title)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                    }
                }
            }
            .navigationTitle("Songs")
            .toolbar {
                Button {
                    modal = .add
                } label : {
                    Label("Add song", systemImage: "plus.circle")
                }
            }
        }
        .sheet(item: $modal, onDismiss: {
            Task {
                do {
                    try await songListViewModel.fetchSongs()
                } catch {
                    print("error: \(error)")
                }
            }
        }) { modal in
            switch modal {
            case .add:
                AddUpdateSong(viewModel: AddUpdateViewModel())
            case .update(let song):
                AddUpdateSong(viewModel: AddUpdateViewModel(currentSong: song))
            }
        }
        .onAppear {
            Task {
                do {
                    try await songListViewModel.fetchSongs()
                } catch {
                    print("error: \(error)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}

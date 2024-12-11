//
//  LibraryViewModel.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 06/12/24.
//

import Observation

@Observable
class LibraryViewModel {
    
    @MainActor
    @ObservationIgnored
    private var playlistUseCase = PlaylistUseCases.shared
    
    var isGridView : Bool = false
    var isPlaylistSelectionOpen : Bool = false
    var isAddPlaylistOpen : Bool = false
    
    var playlist : [Playlist] = []
    
    var errorMessage : String?
    
    var playlistName : String = ""
    
    @MainActor
    func getAllPlaylist () {
        let result = playlistUseCase.getAllPlaylistUseCase.execute()
        
        switch result {
            
        case .success(data: let data):
            print(data)
            playlist = data
        case .error(message: let message):
            print(message)
            errorMessage = message
        }
    }
    
    @MainActor
    func addPlaylist() {
        if (playlistName.isEmpty){
            errorMessage = "Playlist Name Can't be Empty"
            return
        }
        print(playlistName)
        playlistUseCase.addNewPlaylistUseCase.execute(playlistName)
    }
    
    func onTogglePlaylistSelection () {
        isPlaylistSelectionOpen = !isPlaylistSelectionOpen
    }
    
    func onToggleAddPlaylistOpen () {
        isAddPlaylistOpen = !isAddPlaylistOpen
    }
    
    
    func onToggleGridView () {
        isGridView = !isGridView
    }
    
    func clearErrorMessage () {
           errorMessage = nil
       }
}

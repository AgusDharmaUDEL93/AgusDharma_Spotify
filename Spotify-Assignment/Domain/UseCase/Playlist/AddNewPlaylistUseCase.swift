//
//  AddNewPlaylistUseCase.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

import Foundation

class AddNewPlaylistUseCase {
    private var playlistRepository : PlaylistRepository
    
    init(playlistRepository: PlaylistRepository) {
        self.playlistRepository = playlistRepository
    }
    
    
    func execute(_ name : String)  {
        playlistRepository.addNewPlaylist(name: name)
    }
    
}

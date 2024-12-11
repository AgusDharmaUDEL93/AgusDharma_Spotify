//
//  AddSongToPlaylistUseCase.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

import Foundation

class AddSongToPlaylistUseCase {
    private var playlistRepository : PlaylistRepository
    
    init(playlistRepository: PlaylistRepository) {
        self.playlistRepository = playlistRepository
    }
    
    
    func execute(idPlaylist : UUID, song : Song) -> Resource<String> {
        do {
            try playlistRepository.addSongToPlaylist(idPlaylist: idPlaylist, song: song.toSongLocalDto())
            return Resource.success(data: "Success to Add Song")
        } catch {
            return Resource.error(message: "Cannot update data assessment")
        }
    }
    
}

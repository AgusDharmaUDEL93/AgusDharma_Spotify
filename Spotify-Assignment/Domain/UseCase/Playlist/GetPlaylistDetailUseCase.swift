//
//  GetPlaylistDetail.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

import Foundation

class GetPlaylistDetailUseCase {
    private var playlistRepository : PlaylistRepository
    
    init(playlistRepository: PlaylistRepository) {
        self.playlistRepository = playlistRepository
    }
    
    func execute (id : UUID) -> Resource<Playlist?> {
        do {
            let data = try playlistRepository.getPlaylistDetail(id: id ).map({$0.toPlaylist()})
            return Resource.success(data: data)
        } catch {
            return Resource.error(message: "Data assessment cannot be getted")
        }
    }
}

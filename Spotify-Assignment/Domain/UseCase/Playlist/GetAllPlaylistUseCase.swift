//
//  GetAllPlaylistUseCases.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

class GetAllPlaylistUseCase {
    private var playlistRepository : PlaylistRepository
    
    init(playlistRepository: PlaylistRepository) {
        self.playlistRepository = playlistRepository
    }
    
    func execute () -> Resource<[Playlist]> {
        do {
            let data = try playlistRepository.getAllPlaylist().map({$0.toPlaylist()})
            return Resource.success(data: data)
        } catch {
            return Resource.error(message: "Data assessment cannot be getted")
        }
    }
}

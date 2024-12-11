//
//  GetSearchSong.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

import Combine

class GetSearchSongUseCase {
    private let playlistRepository : PlaylistRepository
    
    init(playlistRepository: PlaylistRepository) {
        self.playlistRepository = playlistRepository
    }
    
    func execute(_ keyword : String) -> AnyPublisher<[Song], Error> {
        
        return playlistRepository.getSearchSong(keyword)
            .map{
                return $0.toSong()
            }
            .eraseToAnyPublisher()
    }
}

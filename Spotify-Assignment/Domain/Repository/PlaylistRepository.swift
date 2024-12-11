//
//  PlaylistRepository.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

import Foundation
import Combine

protocol PlaylistRepository {
    
    func getAllPlaylist () throws -> [PlaylistDto]
    
    func getPlaylistDetail (id : UUID ) throws -> PlaylistDto?
    
    func getSearchSong (_ keyword : String) -> AnyPublisher<SongRemoteDto, Error>
    
    func addSongToPlaylist (idPlaylist : UUID, song : SongLocalDto) throws

    func addNewPlaylist (name : String) 
}

//
//  PlaylistUseCases.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

@MainActor
class PlaylistUseCases {
    
    let addSongToPlaylistUseCase = AddSongToPlaylistUseCase(playlistRepository: PlaylistRepositoryImpl.shared)
    
    let getAllPlaylistUseCase = GetAllPlaylistUseCase(playlistRepository: PlaylistRepositoryImpl.shared)
    
    let getPlaylistDetailUseCase = GetPlaylistDetailUseCase(playlistRepository: PlaylistRepositoryImpl.shared)
    
    let getSearchSongUseCase = GetSearchSongUseCase(playlistRepository: PlaylistRepositoryImpl.shared)
    
    let addNewPlaylistUseCase = AddNewPlaylistUseCase(playlistRepository: PlaylistRepositoryImpl.shared)
    
    static let shared = PlaylistUseCases()

}

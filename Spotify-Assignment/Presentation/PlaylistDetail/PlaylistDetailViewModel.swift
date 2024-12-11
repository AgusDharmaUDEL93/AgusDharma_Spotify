//
//  PlaylistDetailViewModel.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 10/12/24.
//

import Observation
import Foundation

@Observable
class PlaylistDetailViewModel {
    
    @MainActor
    @ObservationIgnored
    private var playlistUseCases = PlaylistUseCases.shared
    
    
    var playlist : Playlist?
    
    var errorMessage : String?
    
    
    @MainActor
    func getPlaylistDetail (id : UUID) {
        let result = playlistUseCases.getPlaylistDetailUseCase.execute(id: id)
        
        switch result {
            
        case .success(data: let data):
            self.playlist = data
        case .error(message: let message):
            self.errorMessage = message
        }
    }
    
}

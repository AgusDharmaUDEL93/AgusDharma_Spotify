//
//  SearchViewModel.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 10/12/24.
//

import Observation
import Foundation
import Combine


@Observable
class SearchAddViewModel {
    
    @MainActor
    @ObservationIgnored
    private let playlistUseCases = PlaylistUseCases.shared
    @ObservationIgnored
    private var cancellables = Set<AnyCancellable>()
    
    var querySearch : String = ""
    
    var song : [Song] = []
    
    var isLoading = false
    var errorMessage : String?
    
    
    @MainActor
    func getSongSearch(_ keyword : String){
        isLoading = true
        playlistUseCases.getSearchSongUseCase.execute(keyword)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                }
                self.isLoading = false
            }, receiveValue: { [weak self] song in
                print(song)
                self?.song = song
            })
            .store(in: &cancellables)
    }
    
    @MainActor
    func addSongToPlaylist (idPlaylist : UUID, song : Song) {
        let result = playlistUseCases.addSongToPlaylistUseCase.execute(idPlaylist: idPlaylist , song: song)
        
        switch result {
            
        case .success(data: _):
            break
        case .error(message: let message):
            errorMessage = message
        }
    }
    
   
}

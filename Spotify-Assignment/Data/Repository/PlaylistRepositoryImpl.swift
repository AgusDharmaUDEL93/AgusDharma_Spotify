//
//  PlaylistRepositoryImpl.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

import Combine
import SwiftData
import Foundation

class PlaylistRepositoryImpl : PlaylistRepository {
    
    
    private let modelContainer : ModelContainer
    private let modelContext : ModelContext
    
    private let dataSource = SongDataSource.shared
    
    @MainActor
    static let shared = PlaylistRepositoryImpl()
    
    @MainActor
    private init(){
        self.modelContainer = try! ModelContainer(for: PlaylistDto.self)
        self.modelContext = modelContainer.mainContext
    }
    
    func addNewPlaylist(name: String) {
        modelContext.insert(PlaylistDto( id: UUID(), name: name, song: []))
        print("Added")
    }
    
    func getAllPlaylist() throws -> [PlaylistDto] {
        do {
            let data = try modelContext.fetch(FetchDescriptor<PlaylistDto>())
            print(data)
            return data
            
        } catch {
            throw error
        }
    }
    
    func addSongToPlaylist(idPlaylist: UUID, song: SongLocalDto) throws {
        do {
            try modelContext.fetch(FetchDescriptor<PlaylistDto>(predicate: #Predicate {value in value.id == idPlaylist} )).first?.song.append(song)
            try modelContext.save()
            
            
               } catch {
                   throw error
               }
    }
    
    
    func getPlaylistDetail(id : UUID) throws -> PlaylistDto? {
        do {
            return try modelContext.fetch(FetchDescriptor<PlaylistDto>(predicate: #Predicate {value in value.id == id} )).first
        } catch {
            throw error
        }
    }
    
    func getSearchSong(_ keyword : String) -> AnyPublisher<SongRemoteDto, any Error> {
        return dataSource.getSearchSong(keyword)
    }
    
}

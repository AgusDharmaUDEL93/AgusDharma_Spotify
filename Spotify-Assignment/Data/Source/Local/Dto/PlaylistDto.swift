//
//  PlaylistDto.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 07/12/24.
//

import SwiftData
import Foundation

@Model
class PlaylistDto {
    var id : UUID = UUID()
    var name : String = ""
    var song : [SongLocalDto] = []
    
    init(id: UUID, name: String, song: [SongLocalDto]) {
        self.id = id
        self.name = name
        self.song = song
    }
}

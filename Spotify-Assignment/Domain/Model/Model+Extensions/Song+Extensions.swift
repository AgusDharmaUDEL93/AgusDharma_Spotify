//
//  Song+Extensions.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 07/12/24.
//

extension Song {
    func toSongLocalDto () -> SongLocalDto {
        return SongLocalDto(name: name, singer: singer, image: image)
    }
}

extension SongLocalDto {
    func toSong () -> Song {
        return Song(name: name, singer: singer, image: image)
    }
}

extension SongRemoteDto {
    func toSong () -> [Song] {
        return results.map({Song(name: $0.trackName, singer: $0.artistName, image: $0.artworkUrl100)})
    }
}

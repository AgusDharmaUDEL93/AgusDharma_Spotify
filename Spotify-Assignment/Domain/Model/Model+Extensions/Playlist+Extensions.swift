//
//  Playlist+Extensions.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 07/12/24.
//

extension Playlist {
    func toPlaylistDto () -> PlaylistDto {
        return PlaylistDto(id: id, name: name, song: song.map({$0.toSongLocalDto()}))
    }
}

extension PlaylistDto {
    func toPlaylist () -> Playlist {
        return Playlist(id: id, name: name, song: song.map({$0.toSong()}))
    }
}

//
//  Playlist.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 07/12/24.
//
import SwiftData
import Foundation

struct Playlist {
    var id : UUID = UUID()
    var name : String
    var song : [Song]
}

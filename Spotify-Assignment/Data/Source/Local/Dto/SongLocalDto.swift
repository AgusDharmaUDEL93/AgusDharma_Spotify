//
//  SongDto.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 07/12/24.
//

import SwiftData
import Foundation

@Model
class SongLocalDto {
    var name : String = ""
    var singer : String = ""
    var image : String = ""
    
    init(name: String, singer: String, image: String) {
        self.name = name
        self.singer = singer
        self.image = image
    }
}

//
//  Result.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

enum Resource<T> {
    case success(data : T)
    case error (message : String)
}

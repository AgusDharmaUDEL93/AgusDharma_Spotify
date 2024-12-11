//
//  Router.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 06/12/24.
//

import Observation
import SwiftUI

@Observable
class Router  {
    var navPath = NavigationPath()
    
    public enum Destination  : Codable, Hashable {
        case library
        case searchAdd (playlistId : UUID)
        case playlistDetail(id : UUID)
    }
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}

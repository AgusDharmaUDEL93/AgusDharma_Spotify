//
//  ContentView.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 06/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var router = Router()
    
    var body: some View {
        NavigationStack (path: $router.navPath){
            TabView {
                Tab("Home", systemImage: "house") {
                    HomeScreen()
                }
                
                Tab("Search", systemImage: "magnifyingglass") {
                    SearchScreen()
                }
                
                Tab("Library", systemImage: "books.vertical") {
                    LibraryScreen()
                }
            }
            .navigationDestination(
                for: Router.Destination.self,
                destination: { destination in
                    switch destination {
                    case .library:
                        LibraryScreen()
                    case .playlistDetail(let id):
                        PlaylistDetailScreen(id: id)
                    case .searchAdd(let playlistId):
                        SearchAddScreen(idPlaylist: playlistId)
                    }
                }
            )
        }
        
        .environment(router)
    }
}

#Preview {
    ContentView()
}

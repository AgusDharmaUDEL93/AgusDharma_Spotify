//
//  CardGridPlaylist.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 06/12/24.
//

import SwiftUI

struct CardGridPlaylist : View {
    
    let title : String
    let numberSong : Int
    let action : () -> Void
    
    var body: some View {
        Button(action: action, label: {
            VStack (alignment : .leading) {
                Image("images/dummy/playlist")
                    .resizable()
                    .scaledToFit()
                Text("My first library")
                    .font(.custom("Avenir Next", size: 16))
                    .fontWeight(.semibold)
                Spacer()
                    .frame(height: 4)
                Text ("Playlist \u{2022} \(numberSong) songs")
                    .font(.custom("Avenir Next", size: 12))
                    .fontWeight(.medium)
                
            }
        })
        .buttonStyle(.plain)
        
        
    }
}

#Preview {
    LazyVGrid (columns: [
        GridItem(.adaptive(minimum: 180, maximum: 200)),
        GridItem(.adaptive(minimum: 180, maximum: 200))
    ], spacing: 16) {
        CardGridPlaylist(
            title: "My First Library", numberSong: 60, action: {
                
            }
        )
        CardGridPlaylist(
            title:"My First Library", numberSong: 60, action: {
                
            }
        )

    }
    .padding()
    
}

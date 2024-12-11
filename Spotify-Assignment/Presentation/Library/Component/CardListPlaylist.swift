//
//  CardListPlaylist.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 06/12/24.
//

import SwiftUI

struct CardListPlaylist : View {
    
    let title : String
    let numberSong : Int
    let action : () -> Void
    
    var body: some View {
        
        Button(action: action, label: {
            HStack {
                Image("images/dummy/playlist")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                Spacer()
                    .frame(width: 12)
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.custom("Avenir Next", size: 16))
                        .fontWeight(.semibold)
                    Spacer()
                        .frame(height: 4)
                    Text ("Playlist \u{2022} \(numberSong) songs")
                        .font(.custom("Avenir Next", size: 12))
                        .fontWeight(.medium)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        })
        .buttonStyle(.plain)
        
    }
}

#Preview {
    CardListPlaylist(title: "My First Playlist", numberSong: 50, action: {
        
    })
        .padding()
}

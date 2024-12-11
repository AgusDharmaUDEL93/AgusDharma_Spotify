//
//  CardListSong.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 11/12/24.
//

import SwiftUI

struct CardListPlaylistSong : View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var title : String
    var image : String
    var singer : String
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: image), content: { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Rectangle())
            }, placeholder: {
                Color.gray
                    .frame(width: 60, height: 60)
            })
            Spacer()
                .frame(width: 12)
            VStack (alignment: .leading) {
                Text(title)
                    .font(.custom("Circular-Std", size: 16))
                Spacer()
                    .frame(height: 8)
                Text(singer)
                    .font(.custom("Circular-Std", size: 12))
                    .fontWeight(.light)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Image(colorScheme == .dark ? "images/icon/dark_more" : "images/icon/more")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
                
        }
    }
}

#Preview {
    CardListPlaylistSong(title: "We Cry Together", image: "https://is1-ssl.mzstatic.com/image/thumb/Video/0a/f8/c0/dj.hzdaswne.jpg/100x100bb.jpg", singer: "Kendrick Lamar, Taylour Paige")
        .padding()
}

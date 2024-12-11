//
//  CardListSong.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 10/12/24.
//

import SwiftUI

struct CardListSong : View {
    
    
    let title : String
    let singer : String
    let image : String
    let action : () -> Void
    
    
    var body: some View {
        
        Button(action: action , label: {
            HStack  {
                AsyncImage(url: URL(string: image), content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }, placeholder: {
                    Color.gray
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                })
                   
                Spacer()
                    .frame(width: 16)
                
                VStack  (alignment: .leading) {
                    Text(title)
                        .font(.custom("Avenir Next", size: 20))
                        .fontWeight(.medium)
                    Text("Song \u{2022} \(singer)")
                        .font(.custom("Avenir Next", size: 14))
                }
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        })
        .buttonStyle(.plain)
        
    }
}

#Preview {
    CardListSong(
        title: "Les",
        singer: "Childish Gambino",
        image: "https://is1-ssl.mzstatic.com/image/thumb/Video/0a/f8/c0/dj.hzdaswne.jpg/100x100bb.jpg",
        action: {
            
        }
    )
        .padding()
}

//
//  PlaylistDetailScreen.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 10/12/24.
//

import SwiftUI

struct PlaylistDetailScreen : View {
    
    @Environment(\.dismiss) var dismiss
    @State var viewModel = PlaylistDetailViewModel()
    @Environment(Router.self) var router
    
    let id : UUID
    
    var body: some View {
        ScrollView {
            VStack {
                VStack (alignment:.leading) {
                    Spacer()
                        .frame(height: 24)
                    Text(viewModel.playlist?.name ?? "No Playlist Data")
                        .font(.custom("Circular-Std", size: 20))
                        .bold()
                    Spacer()
                        .frame(height: 8)
                    Text("\(viewModel.playlist?.song.count ?? 0) songs")
                        .font(.custom("Circular-Std", size: 12))
                        .bold()
                    Spacer()
                        .frame(height: 76)
                    if (viewModel.playlist != nil){
                        ForEach(viewModel.playlist!.song, id: \.self) { song in
                            CardListPlaylistSong(title: song.name, image: song.image, singer: song.singer)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                })
                .buttonStyle(.plain)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    router.navigate(to: .searchAdd(playlistId: id))
                }, label: {
                    Image(systemName: "plus")
                })
                .buttonStyle(.plain)
            }
        }
        .background( LinearGradient(gradient: Gradient(colors: [.blue, .white.opacity(0), .white.opacity(0), .white.opacity(0), .white.opacity(0), .white.opacity(0), .white.opacity(0), .white.opacity(0), .white.opacity(0),.white.opacity(0) ,.white.opacity(0)]), startPoint: .top, endPoint: .bottom))
        .onAppear{
            viewModel.getPlaylistDetail(id: id)
        }
    }
}

#Preview {
    NavigationStack {
        PlaylistDetailScreen(
            id: UUID()
        )
        .environment(Router())
        
    }
}

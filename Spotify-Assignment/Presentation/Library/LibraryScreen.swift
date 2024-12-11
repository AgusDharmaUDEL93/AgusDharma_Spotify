//
//  LibraryScreen.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 06/12/24.
//

import SwiftUI

struct LibraryScreen : View {
    
    @State var viewModel = LibraryViewModel()
    @Environment(\.colorScheme) var colorScheme
    @Environment(Router.self) var router
    
    var body: some View {
        ScrollView {
            HStack {
                Image("images/dummy/avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                Text(
                    "Your Library"
                )
                .font(.custom("Avenir Next", size: 24))
                .fontWeight(.semibold)
                Spacer()
                Button(
                    action: {
                        viewModel.onTogglePlaylistSelection()
                    }, label: {
                        Image(systemName: "plus")
                    }
                )
                .buttonStyle(.plain)
                
            }
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Playlists")
                        .font(.custom("Avenir Next", size: 12))
                })
                .frame(height: 0)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius:100))
                .background(RoundedRectangle(cornerRadius: 100)
                    .stroke(.primary, lineWidth: 1))
                .buttonStyle(.plain)
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    viewModel.onToggleGridView()
                }, label: {
                    Image(systemName: viewModel.isGridView ? "list.bullet" : "square.grid.2x2")
                })
                .buttonStyle(.plain)
            }
            .padding(.vertical)
            
            if (viewModel.playlist.isEmpty){
                VStack {
                    Text("No Data")
                }
            } else {
                if (viewModel.isGridView){
                    LazyVGrid (columns: [
                        GridItem(.adaptive(minimum: 180, maximum: 200)),
                        GridItem(.adaptive(minimum: 180, maximum: 200))
                    ], spacing: 16) {
                        ForEach( viewModel.playlist, id: \.id){ data in
                            CardGridPlaylist(
                                title: data.name,
                                numberSong: data.song.count,
                                action: {
                                    router.navigate(to: .playlistDetail(id: data.id))
                                }
                            )
                        }
                        
                    }
                } else {
                    VStack (alignment : .leading) {
                        ForEach(viewModel.playlist, id: \.id){ data in
                            CardListPlaylist(
                                title: data.name,
                                numberSong: data.song.count,
                                action: {
                                    router.navigate(to: .playlistDetail(id: data.id))
                                }
                            )
                        }
                    }
                }
            }
        }
        .onAppear{
            viewModel.getAllPlaylist()
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: {
                    viewModel.errorMessage != nil
                },
                set: { _ in
                    
                }
            ),
            actions: {
                Button(
                    role: .cancel,
                    action: {
                        viewModel.clearErrorMessage()
                    },
                    label: {
                        Text("Okay")
                    }
                )
            },
            message: {
                Text(viewModel.errorMessage ?? "Unexpected Error Occured")
            }
        )
        .padding()
        .sheet(
            isPresented: $viewModel.isPlaylistSelectionOpen,
            content: {
                VStack {
                    Button(action: {
                        viewModel.onTogglePlaylistSelection()
                        viewModel.onToggleAddPlaylistOpen()
                    }, label: {
                        HStack {
                            VStack {
                                Image(systemName: "music.note.list")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                                Text("Playlist")
                                    .font(.custom("Montserrat", size: 12))
                            }
                            Spacer()
                                .frame(width: 20)
                            VStack (alignment : .leading) {
                                Text("Playlist")
                                    .font(.custom("Circular-Std", size: 20))
                                    .fontWeight(.semibold)
                                Text("Create a playlist with a song")
                                    .font(.custom("Circular-Std", size: 14))
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    })
                    .buttonStyle(.plain)
                    
                    Spacer()
                }
                .padding()
                .padding(.top, 16)
                .presentationDetents([.height(80)])
                
            }
        )
        .sheet(
            isPresented: $viewModel.isAddPlaylistOpen,
            content: {
                VStack {
                    Text("Name your playlist.")
                        .font(.custom("Circular-Std", size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                        .frame(height: 100)
                    TextField(
                        text: $viewModel.playlistName,
                        label: {
                            Text("My First Library")
                                .foregroundStyle( colorScheme == .dark ? .white : .black)
                        }
                    )
                    Divider()
                        .overlay(colorScheme == .dark ? .white : .black)
                    Spacer()
                        .frame(height: 40)
                    Button(action: {
                        viewModel.onToggleAddPlaylistOpen()
                        viewModel.addPlaylist()
                        viewModel.getAllPlaylist()
//                        router.navigate(to: .playlistDetail(id: viewModel.playlist.last?.id ?? UUID() ))
                    }, label: {
                        Text("Confirm")
                            .font(.custom("Circular-Std", size: 20))
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                    })
                    .buttonStyle(.borderedProminent)
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                    .tint(.green)
                    .foregroundStyle(.black)
                }
                .padding(.horizontal, 40)
            }
        )
        
    }
}

#Preview {
    LibraryScreen()
        .environment(Router())
}

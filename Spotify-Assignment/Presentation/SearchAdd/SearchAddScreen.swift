//
//  SearchScreen.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 06/12/24.
//
import SwiftUI

struct SearchAddScreen : View {
    
    @State var viewModel = SearchAddViewModel()
    @Environment(Router.self) var router
    
    let idPlaylist : UUID
    
    var body: some View {
        ScrollView {
            VStack (alignment : .leading) {
                Text("Recent searches")
                    .font(.custom("Avenir Next", size: 17))
                    .fontWeight(.semibold)
                if (viewModel.isLoading){
                    ProgressView()
                }else {
                    if (viewModel.song.isEmpty){
                        VStack {
                            Text("No Data")
                        }
                        .frame(maxWidth: .infinity)
                    } else {
                        ForEach(viewModel.song, id: \.self){data in
                            CardListSong(
                                title: data.name,
                                singer: data.singer,
                                image: data.image,
                                action: {
                                    viewModel.addSongToPlaylist(idPlaylist: idPlaylist, song: data)
                                    router.navigateBack()
                                }
                            )
                        }
                    }
                }
                
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        .searchable(text: $viewModel.querySearch, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: viewModel.querySearch, {
            if (!viewModel.querySearch.isEmpty){
                viewModel.getSongSearch(viewModel.querySearch)
            }
        })
        .navigationBarBackButtonHidden()
        .padding()
    }
}

#Preview {
    NavigationStack{
        SearchAddScreen(
            idPlaylist: UUID()
        )
        .environment(Router())
    }
}

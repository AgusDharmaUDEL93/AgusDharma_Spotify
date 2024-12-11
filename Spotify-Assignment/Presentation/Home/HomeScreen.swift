//
//  HomeScreen.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 06/12/24.
//

import SwiftUI

struct HomeScreen : View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Home Screen")
        }
        .padding()
    }
}

#Preview {
    HomeScreen()
}

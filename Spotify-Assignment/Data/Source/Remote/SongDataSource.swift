//
//  SongDataSource.swift
//  Spotify-Assignment
//
//  Created by Putu Agus Dharma Kusuma on 09/12/24.
//

import Combine
import Foundation

class SongDataSource {
    private var apiClient : APIClient = APIClient.shared
    private var appConfiguration : AppConfiguration = AppConfiguration.shared
    
    static let shared = SongDataSource()
    
    func getSearchSong (_ keyword : String) -> AnyPublisher<SongRemoteDto, Error> {
        guard let url = URL(string: appConfiguration.baseURL + "search?term=\(keyword)&entity=musicVideo") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return apiClient.request(url: url, method: .get)
    }
}

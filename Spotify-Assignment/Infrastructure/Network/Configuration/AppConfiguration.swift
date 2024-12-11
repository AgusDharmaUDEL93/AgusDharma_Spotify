//
//  ApiConfiguration.swift
//  User-Api
//
//  Created by Putu Agus Dharma Kusuma on 28/11/24.
//

class AppConfiguration  {
    
    static let shared = AppConfiguration()
    
    var baseURL: String {
        return "https://itunes.apple.com/"
    }
}

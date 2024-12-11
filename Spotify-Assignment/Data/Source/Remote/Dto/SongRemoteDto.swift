// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let songRemoteDto = try? JSONDecoder().decode(SongRemoteDto.self, from: jsonData)

import Foundation

// MARK: - SongRemoteDto
struct SongRemoteDto: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let wrapperType: WrapperType
    let kind: Kind
    let artistID, trackID: Int
    let artistName, trackName, trackCensoredName: String
    let artistViewURL, trackViewURL: String
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double?
    let releaseDate: Date
    let collectionExplicitness, trackExplicitness: Explicitness
    let trackTimeMillis: Int?
    let country: Country
    let currency: Currency
    let primaryGenreName: String
    let collectionID: Int?
    let collectionName, collectionCensoredName: String?
    let collectionViewURL: String?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let contentAdvisoryRating: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName
        case collectionID = "collectionId"
        case collectionName, collectionCensoredName
        case collectionViewURL = "collectionViewUrl"
        case discCount, discNumber, trackCount, trackNumber, contentAdvisoryRating
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
    }

    // Custom decoding to handle releaseDate
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        wrapperType = try container.decode(WrapperType.self, forKey: .wrapperType)
        kind = try container.decode(Kind.self, forKey: .kind)
        artistID = try container.decode(Int.self, forKey: .artistID)
        trackID = try container.decode(Int.self, forKey: .trackID)
        artistName = try container.decode(String.self, forKey: .artistName)
        trackName = try container.decode(String.self, forKey: .trackName)
        trackCensoredName = try container.decode(String.self, forKey: .trackCensoredName)
        artistViewURL = try container.decode(String.self, forKey: .artistViewURL)
        trackViewURL = try container.decode(String.self, forKey: .trackViewURL)
        previewURL = try container.decodeIfPresent(String.self, forKey: .previewURL)
        artworkUrl30 = try container.decode(String.self, forKey: .artworkUrl30)
        artworkUrl60 = try container.decode(String.self, forKey: .artworkUrl60)
        artworkUrl100 = try container.decode(String.self, forKey: .artworkUrl100)
        collectionPrice = try container.decodeIfPresent(Double.self, forKey: .collectionPrice)
        trackPrice = try container.decodeIfPresent(Double.self, forKey: .trackPrice)

        // Parse releaseDate
        let releaseDateString = try container.decode(String.self, forKey: .releaseDate)
        let dateFormatter = ISO8601DateFormatter()
        if let parsedDate = dateFormatter.date(from: releaseDateString) {
            releaseDate = parsedDate
        } else {
            throw DecodingError.dataCorruptedError(forKey: .releaseDate, in: container, debugDescription: "Date string does not match expected format.")
        }

        collectionExplicitness = try container.decode(Explicitness.self, forKey: .collectionExplicitness)
        trackExplicitness = try container.decode(Explicitness.self, forKey: .trackExplicitness)
        trackTimeMillis = try container.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
        country = try container.decode(Country.self, forKey: .country)
        currency = try container.decode(Currency.self, forKey: .currency)
        primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
        collectionID = try container.decodeIfPresent(Int.self, forKey: .collectionID)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        collectionCensoredName = try container.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        collectionViewURL = try container.decodeIfPresent(String.self, forKey: .collectionViewURL)
        discCount = try container.decodeIfPresent(Int.self, forKey: .discCount)
        discNumber = try container.decodeIfPresent(Int.self, forKey: .discNumber)
        trackCount = try container.decodeIfPresent(Int.self, forKey: .trackCount)
        trackNumber = try container.decodeIfPresent(Int.self, forKey: .trackNumber)
        contentAdvisoryRating = try container.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
        collectionArtistID = try container.decodeIfPresent(Int.self, forKey: .collectionArtistID)
        collectionArtistViewURL = try container.decodeIfPresent(String.self, forKey: .collectionArtistViewURL)
    }
}

enum Explicitness: String, Codable {
    case cleaned = "cleaned"
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case musicVideo = "music-video"
}

enum WrapperType: String, Codable {
    case track = "track"
}

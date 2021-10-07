//
//  SearchResponse.swift
//  AppleMusic
//
//  Created by Ольга Шубина on 05.10.2021.
//

import Foundation

struct SearchResponse: Decodable {
    
    var resultCount: Int
    var results: [TrackInfo]
    
}

struct TrackInfo: Decodable {
    
    var artistName: String
    var trackName: String
    var collectionName: String?
    var artworkUrl100: String?
    var previewUrl: String?
    
}

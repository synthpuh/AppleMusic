//
//  SearchModels.swift
//  AppleMusic
//
//  Created by Ольга Шубина on 05.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Search {
    
    enum Model {
        struct Request {
            enum RequestType {
                case some
                case getTracks(searchText: String)
            }
        }
        struct Response {
            enum ResponseType {
                case some
                case presentTracks(searchResponse: SearchResponse?)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case some
                case displayTracks(searchViewModel: SearchViewModel)
            }
        }
    }
}

struct SearchViewModel {
    
    struct Cell: TrackCellViewModel {
        
        var iconURLString: String?
        var artistName: String
        var trackName: String
        var albumName: String?
        var musicPreviewUrl: String?
        
    }
    
    let cells: [Cell]
    
}

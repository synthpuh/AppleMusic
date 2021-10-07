//
//  NetworkService.swift
//  AppleMusic
//
//  Created by Ольга Шубина on 05.10.2021.
//

import UIKit

class NetworkService {
    
    func fetchTracks(with searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        
        var searchTerm = ""
        for char in searchText {
            if char == " " {
                searchTerm.append("+")
            } else {
                searchTerm.append(char)
            }
        }
        
        let urlString = "https://itunes.apple.com/search?media=music&term=\(searchTerm)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    let objects = try decoder.decode(SearchResponse.self, from: data)
                    print("Objects: \(objects)")
                    
                    completion(objects)
                    
                } catch let jsonError {
                    print("JSONError: \(jsonError)")
                    completion(nil)
                }
            }
        }.resume()
        
    }
    
}

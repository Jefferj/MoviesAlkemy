//
//  MoviesDetailDTO.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 17/09/22.
//

import Foundation

struct MoviesDetailDTO: Codable {
    
    let genres: [Genre]
}

struct Detail: Codable {
    var genres : Genre
}

struct Genre: Codable {
    
    let id: Int
    let name: String
        
}
        

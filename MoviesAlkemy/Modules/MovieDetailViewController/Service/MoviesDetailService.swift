//
//  MoviesDetailService.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 17/09/22.
//

import Foundation

class MoviesDetailService {
    
    func getMovie(urlMovie: String,
                    onComplete: @escaping (MoviesDetailDTO) -> Void,
                     onError: @escaping (String) -> Void) {
        
        ApiManager.shared.getCall(url: urlMovie) { response in
            
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let result = try decoder.decode(MoviesDetailDTO.self, from: data)
                        onComplete(result)
                    }
                } catch {
                    onError("no se pudo procesar el json")
                }
            case .failure(_):
                onError("error en la api")
            }
        }
        
    }
    
}

//
//  MovieListService.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 14/09/22.
//

import Foundation

class MovieListService {
    
    func getMovies(onComplete: @escaping ([MoviesDTO]) -> Void,
                   onError: @escaping (String) -> Void ){
        ApiManager.shared.getCall(url: "https://api.themoviedb.org/3/movie/popular?api_key=469821b988270d2366e546a380e03332") { response in
            
            switch response {
            case .success(let data):
                do{
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let result = try decoder.decode(MovieListDTO.self, from: data)
                        onComplete(result.results)
                    }
                }catch{
                    onError("Could not process json")
                }
            case .failure(_):
                onError("Erron in API")
            }
        }
    }
}

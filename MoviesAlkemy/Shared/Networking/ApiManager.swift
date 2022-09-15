//
//  ApiManager.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 14/09/22.
//

import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    
    func getCall(url: String, success: @escaping (Result<Data?, AFError>) -> Void ) {
        AF.request(url).response { response in
            success(response.result)
        }
    }
}

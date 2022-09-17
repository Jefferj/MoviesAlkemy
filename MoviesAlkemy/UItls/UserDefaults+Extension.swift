//
//  UserDefaults.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 17/09/22.
//

import Foundation

extension UserDefaults {
    var isUserLoggedIn: Bool {
        get { self.bool(forKey: #function) }
        set { self.setValue(newValue, forKey: #function) }
    }
}

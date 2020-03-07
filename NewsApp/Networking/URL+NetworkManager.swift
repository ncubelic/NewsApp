//
//  URL+NetworkManager.swift
//  Networking
//
//  Created by Nikola on 17.8.2019..
//  Copyright © 2019 Lion Code. All rights reserved.
//

import Foundation

extension URL {
    
    static var base: URL {
        let bundle = Bundle(for: NetworkManager.self)
        guard let basePath = bundle.infoDictionary?["BASE_URL_PATH"] as? String else {
            fatalError("BASE_URL_PATH doesn't exist in Info.plist")
        }
        
        guard let baseURL = URL(string: basePath) else {
            fatalError("BASE_URL_PATH in Info.plist is not valid")
        }
        return baseURL
    }
    
    static var apiKey: String {
        let bundle = Bundle(for: NetworkManager.self)
        guard let apiKey = bundle.infoDictionary?["API_KEY"] as? String else {
            fatalError("API_KEY doesn't exist in Info.plist")
        }
        return apiKey
    }
}

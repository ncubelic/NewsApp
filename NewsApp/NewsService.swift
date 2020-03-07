//
//  NewsService.swift
//  NewsApp
//
//  Created by Nikola on 4.3.2020..
//  Copyright © 2020 Nikola. All rights reserved.
//

import Foundation

class NewsService {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchNews(then handler: @escaping (Result<NewsList, ErrorReport>) -> Void) {
        var resource = Resource<NewsList>(path: NetworkConstants.Endpoint.topHeadlines)
        resource.api = .v2
        resource.headers = [
            "X-Api-Key": URL.apiKey
        ]
        resource.queryItems = [
            URLQueryItem(name: "country", value: "us")
        ]
        networkManager.apiCall(for: resource, completion: handler)
    }
}

//
//  NewsList.swift
//  NewsApp
//
//  Created by Nikola on 4.3.2020..
//  Copyright © 2020 Nikola. All rights reserved.
//

import Foundation

struct NewsList: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}

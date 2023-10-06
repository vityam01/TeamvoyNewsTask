//
//  NewsAPIResponse.swift
//  NewsAppTeamvoy
//
//  Created by Vitya Mandryk on 06.10.2023.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}

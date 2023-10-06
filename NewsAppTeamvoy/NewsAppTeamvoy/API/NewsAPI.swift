//
//  NewsAPI.swift
//  NewsAppTeamvoy
//
//  Created by Vitya Mandryk on 06.10.2023.
//

import Foundation

struct NewsAPI {
    
    static let shared = NewsAPI()
    private init() {}
    
    private let apiKey = "8d154952fbe043b6a1ad8d2bcda85232"
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetch(from category: Category) async throws -> [Article] {
        try await fetchArticles(from: generateNewsURL(from: category))
    }
    
    func search(for query: String, date: String) async throws -> [Article] {
        try await fetchArticles(from: generateSearchURL(from: query, date: date))
    }
    
    private func fetchArticles(from url: URL) async throws -> [Article] {
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
        }
        
        switch response.statusCode {
            
        case (200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw generateError(description: apiResponse.message ?? "An error occured")
            }
        default:
            throw generateError(description: "A server error occured")
        }
    }
    
    private func generateError(code: Int = 1, description: String) -> Error {
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
    private func generateSearchURL(from query: String, date: String?) -> URL {
        let percentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        var url = "https://newsapi.org/v2/everything?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&q=\(percentEncodedString)"
        if date != "" {
            url += "&from\(date ?? "")"}
        return URL(string: url)!
    }
    
    private func generateNewsURL(from category: Category) -> URL {
        var url = "https://newsapi.org/v2/top-headlines?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&category=\(category.rawValue)"
        return URL(string: url)!
    }
}

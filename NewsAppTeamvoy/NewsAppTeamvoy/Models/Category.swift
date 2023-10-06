//
//  Category.swift
//  NewsAppTeamvoy
//
//  Created by Vitya Mandryk on 06.10.2023.
//

import Foundation

enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
}

extension Category: Identifiable {
    var id: Self { self }
}

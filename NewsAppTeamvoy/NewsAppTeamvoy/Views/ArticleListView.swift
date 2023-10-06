//
//  ArticleListView.swift
//  NewsAppTeamvoy
//
//  Created by Vitya Mandryk on 06.10.2023.
//

import SwiftUI

struct ArticleListView: View {
    let articles: [Article]
    @State private var selectedArticle: Article?

    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    NavigationLink(destination: DetailView(article: article)) {
                        ArticleRowView(article: article)
                    }
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    
    @StateObject static var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    static var previews: some View {
        NavigationView {
            ArticleListView(articles: Article.previewData)
                .environmentObject(articleBookmarkVM)
        }
    }
}



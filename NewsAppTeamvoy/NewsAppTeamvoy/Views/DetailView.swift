//
//  DetailView.swift
//  NewsAppTeamvoy
//
//  Created by Vitya Mandryk on 07.10.2023.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title)
                    .padding(.bottom, 8)
                
                AsyncImage(url: article.imageURL) { phase in
                    switch phase {
                    case .empty:
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    case .failure:
                        HStack {
                            Spacer()
                            Image(systemName: "photo")
                                .imageScale(.large)
                            Spacer()
                        }
                        
                        
                    @unknown default:
                        fatalError()
                    }
                }
                .frame(minHeight: 200, maxHeight: 300)
                .background(Color.gray.opacity(0.3))
                .clipped()
                
                Text("Author: \(article.authorText)")
                    .font(.headline)
                    .padding(.bottom, 4)
                
                Text("Published: \(article.captionText)")
                    .font(.subheadline)
                    .padding(.bottom, 4)
                
                Text("Description: \(article.descriptionText)")
                    .font(.body)
                    .padding(.bottom, 16)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Article Details")
    }
}

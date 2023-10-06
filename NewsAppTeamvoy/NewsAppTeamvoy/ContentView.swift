//
//  ContentView.swift
//  NewsAppTeamvoy
//
//  Created by Vitya Mandryk on 06.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            SearchTabView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

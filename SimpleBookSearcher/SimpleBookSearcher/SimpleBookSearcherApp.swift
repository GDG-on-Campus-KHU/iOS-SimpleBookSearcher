//
//  SimpleBookSearcherApp.swift
//  SimpleBookSearcher
//
//  Created by 박현빈 on 3/16/25.
//

import SwiftUI

@main
struct SimpleBookSearcherApp: App {
    var body: some Scene {
        WindowGroup {
            SearchBar(searchText: .constant("한강")){
                
            }
        }
    }
}

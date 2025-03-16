//
//  BookFinder.swift
//  SimpleBookSearcher
//
//  Created by 박현빈 on 3/16/25.
//

import Foundation
import Alamofire

class BookFinder: ObservableObject {
    @Published var books: [Book] = []
    @Published var isEnd = true
    @Published var isError = false
    
    let apiKey = <apiKey>
    let endPoint = "https://openapi.naver.com/v1/search/book.json"

    func search(query: String, at page: Int) {
        let headers: HTTPHeaders = ["Authorization": apiKey]
        let params: Parameters = ["query": query, "page": page]
        AF.request(endPoint, method: .get, parameters: params, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BookRoot.self) { response in
                switch response.result {
                case .success(let bookRoot):
                    self.books = bookroots.books
                    print(self.books)
                case .failure(let error):
                    self.isError = true
                    print(error.localizedDescription)
                }
            }
    }
}



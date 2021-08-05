//
//  book.swift
//  firebase_Test_book
//
//  Created by HHI on 2021/07/31.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct book: Identifiable, Hashable, Codable {
//    @DocumentID var id : String? = UUID().uuidString
    var id : String = UUID().uuidString
    var title: String
    var author: String
    var pages: Int
    
//    enum Codingkeys: String, CodingKey {
//        case title
//        case author
//        case numberOfPages = "pages"
    }
//}

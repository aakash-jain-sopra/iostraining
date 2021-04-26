//
//  FeedItem.swift
//  NSUrlSession
//
//  Created by Aakash Jain on 16/04/21.
//

import Foundation

class FeedItem {
    let title: String
    let imageUrl: URL
    
    init(title: String, url: URL) {
        self.title = title
        self.imageUrl = url
    }
    
}

//
//  Feed.swift
//  NSUrlSession
//
//  Created by Aakash Jain on 16/04/21.
//

import Foundation

class Feed {
 
    let items: [FeedItem]
    
    init(itemsArr: [FeedItem]) {
        self.items = itemsArr
    }
    
    convenience init? (data data: Data) {
        
        var newItems = [FeedItem]()
        
        var dictData: Dictionary<String, AnyObject>?
        
        do {
        dictData = try (JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? Dictionary<String, AnyObject>)!
        } catch{
            
        }
        
        guard let feedRoot = dictData else {
            return nil
        }
        
        guard let d = feedRoot["data"] else {
            return nil
        }
        
        guard let items = d["memes"] as? Array<AnyObject> else {
            return nil
        }
        
        for item in items {
            guard let itemDict = item as? Dictionary<String, AnyObject> else {
                continue
            }
            
            guard let urlString = itemDict["url"] as? String else {
                continue
            }
            
            guard let url = URL(string: urlString) else {
                continue
            }
            
            let title = itemDict["name"] as? String
            
            newItems.append(FeedItem(title: title ?? "no-title", url: url))
        }
        
        self.init(itemsArr: newItems)
    }
    
}

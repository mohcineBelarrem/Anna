//
//  HistoryManager.swift
//  Anna
//
//  Created by Mohcine Belarrem on 09/07/2019.
//  Copyright © 2019 belarrem. All rights reserved.
//

import Foundation


final class HistoryManager {
    private init() {}
    static let shared = HistoryManager()
    
    private var history = [String]()
    
    
    func listSize() -> Int {
        return history.count
    }
    
    func historyElement(index : Int) -> String {
        let ct = history.count
        return history[ct - index - 1]
    }
    
    func append(newElement : String)  {
        
        guard !history.isEmpty else {
            history.append(newElement)
            return
        }
        
        if let lastElement = history.last, lastElement != newElement {
            history.append(newElement)
        }
        
    }
    
    
    
}

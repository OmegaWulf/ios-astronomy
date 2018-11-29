    //
//  Cache.swift
//  Astronomy
//
//  Created by Nikita Thomas on 11/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class Cache<Key: Hashable, Value> {
    
    private var cacheDict: [Key: Value] = [:]
    private let queue = DispatchQueue(label: "lalala")
    
    
    
    func cache(value: Value, for key: Key) {
        queue.async {
            self.cacheDict[key] = value
        }
    }
    
    
    func value(for key: Key) -> Value? {
        var value: Value?
        queue.sync {
            value = cacheDict[key]
        }
        return value
    }
    
}

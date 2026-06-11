//
//  Item.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

//
//  Tea.swift
//  BubbleTeaOrders
//
//  Created by Scott on 7/23/20.
//  Copyright © 2020 Scott. All rights reserved.
//

import Foundation

struct Tea {
    
    let name: String
    let imageURL: String
    let price: Double
}

extension Tea {
    
    static func all() -> [Tea] {
        return [
            Tea(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Tea(name: "Expresso", imageURL: "Expresso", price: 2.1),
            Tea(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}

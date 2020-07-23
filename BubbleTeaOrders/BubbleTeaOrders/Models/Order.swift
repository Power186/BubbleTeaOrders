//
//  Order.swift
//  BubbleTeaOrders
//
//  Created by Scott on 7/23/20.
//  Copyright © 2020 Scott. All rights reserved.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}

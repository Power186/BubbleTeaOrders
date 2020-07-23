//
//  TeaViewModel.swift
//  BubbleTeaOrders
//
//  Created by Scott on 7/23/20.
//  Copyright © 2020 Scott. All rights reserved.
//

import Foundation

class TeaListViewModel {
    var coffeeList: [TeaViewModel] = [TeaViewModel]()
}

struct TeaViewModel {
    var tea: Tea
    
    init(tea: Tea) {
        self.tea = tea
    }
    
    var name: String {
        return self.tea.name
    }
    
    var imageURL: String {
        return self.tea.imageURL
    }
    
    var price: Double {
        return self.tea.price
    }
}

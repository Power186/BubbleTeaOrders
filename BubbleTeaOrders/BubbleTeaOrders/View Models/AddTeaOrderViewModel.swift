//
//  AddTeaOrderViewModel.swift
//  BubbleTeaOrders
//
//  Created by Scott on 7/23/20.
//  Copyright © 2020 Scott. All rights reserved.
//

import Foundation

class AddTeaOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var webservice: Webservice
    
    var teaList: [TeaViewModel] {
        return Tea.all().map(TeaViewModel.init)
    }
    
    init() {
        self.webservice = Webservice()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        
        self.webservice.createTeaOrder(order: order) { _ in
            
        }
        
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
            return prices[self.size]!
    }
    
    private func calculateTotalPrice() -> Double {
        let teaVM = teaList.first { $0.name == coffeeName }
        if let teaVM = teaVM {
            return teaVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
}


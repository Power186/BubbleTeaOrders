//
//  AddTeaOrderView.swift
//  BubbleTeaOrders
//
//  Created by Scott on 7/23/20.
//  Copyright © 2020 Scott. All rights reserved.
//

import SwiftUI

struct AddTeaOrderView: View {
    
    @Binding var isPresented: Bool
    @ObservedObject private var addTeaOrderVM = AddTeaOrderViewModel()
    
    var body: some View {
        
        NavigationView {
                        
            VStack {
                
                Form {
                    
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter name", text: self.$addTeaOrderVM.name)
                    }
                    
                    Section(header: Text("SELECT TEA").font(.body)) {
                        
                        ForEach(addTeaOrderVM.teaList, id: \.name) { tea in
                            
                            TeaCellView(tea: tea, selection: self.$addTeaOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("SELECT SIZE").font(.body),
                            footer: OrderTotalView(total: self.addTeaOrderVM.total)) {
                                Picker("",selection: self.$addTeaOrderVM.size) {
                                    Text("Small").tag("Small")
                                    Text("Medium").tag("Medium")
                                    Text("Large").tag("Large")
                                }.pickerStyle(SegmentedPickerStyle())
                                    .background(Color.orange)
                    }
                }
                HStack {
                Button("Place Order") {
                    self.addTeaOrderVM.placeOrder()
                    self.isPresented = false
                    }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(Color.white)
                    .background(Color.green)
                .cornerRadius(10)
            }.navigationBarTitle("Add Order")
        }
    }
}

struct AddTeaOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddTeaOrderView(isPresented: .constant(false))
    }
}

struct TeaCellView: View {
    
    let tea: TeaViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(tea.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(tea.name)
                .font(.title)
                .padding([.leading], 20)
                .foregroundColor(Color.pink)
            Spacer()
            Image(systemName: self.selection ==
                self.tea.name ? "checkmark": "").padding()
        }.onTapGesture {
            self.selection = self.tea.name
            
        }
    }
}

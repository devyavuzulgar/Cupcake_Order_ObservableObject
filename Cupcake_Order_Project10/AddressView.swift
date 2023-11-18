//
//  AddressView.swift
//  Cupcake_Order_Project10
//
//  Created by Yavuz Ulgar on 17.07.2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order

    var body: some View {
        Form {
            Section {
                TextField(text: $order.name) {
                    Text("Name")
                }
                TextField(text: $order.streetAddress) {
                    Text("Street Address")
                }
                TextField(text: $order.city) {
                    Text("City")
                }
                TextField(text: $order.zip) {
                    Text("Zip")
                }
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}

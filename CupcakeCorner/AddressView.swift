//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Gunther Masi Haas on 21/06/2024.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Prénom et Nom", text: $order.name)
                TextField("Adresse", text: $order.streetAddress)
                TextField("Ville", text: $order.city)
                TextField("Code Postale", text: $order.zip)
            }
            
            Section {
                NavigationLink("Vérifier") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Details de livraison")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}

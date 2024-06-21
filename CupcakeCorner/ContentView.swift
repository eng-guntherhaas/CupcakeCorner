//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Gunther Masi Haas on 21/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Choisissez votre type de gâteau", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Quantité de gâteau : \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Avez-vous des demandes particulières ?", isOn: $order.specialRequestEnabled)

                    if order.specialRequestEnabled {
                        Toggle("Ajouter de glaçage supplémentaire", isOn: $order.extraFrosting)

                        Toggle("Ajouter des paillettes supplémentaires", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Details de livraison") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
        
    }
}

#Preview {
    ContentView()
}

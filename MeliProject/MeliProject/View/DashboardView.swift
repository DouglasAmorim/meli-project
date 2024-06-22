//
//  DashboardView.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import SwiftUI

struct DashboardView: View {
    
    var products: [ProductModel] = []
    
    var body: some View {
        List {
            ForEach(products.shuffled()) { product in
                NavigationLink(destination: ContentView(), label: {
                    ProductRowView(product: product)
                        .padding(.vertical, 4)
                })
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

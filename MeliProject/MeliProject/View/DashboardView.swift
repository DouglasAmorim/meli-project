//
//  DashboardView.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var dashboardViewModel = DashboardViewModel(listProductsService: ListProductsService())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dashboardViewModel.products) { product in
                    NavigationLink(destination: ProductDetailView(product: product), label: {
                        ProductRowView(product: product)
                            .padding(.vertical, 4)
                    })
                }
            }
            .navigationTitle("Products")
        }
        .onAppear(perform: {
            print("VIEW: DashboardView - onAppear")
            dashboardViewModel.getListProducts()
        })
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

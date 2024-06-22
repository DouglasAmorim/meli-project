//
//  DashboardView.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var dashboardViewModel = DashboardViewModel(listProductsService: ProductsService())
    @State private var isShowingFilter: Bool = false
    @AppStorage("selectedCategory") var selectedCategory: String = "MLA1055"
    
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
            .navigationBarItems(trailing:
                                    Button(action: {
                                        isShowingFilter = true
                                    }) {
                                        Image(systemName: "slider.horizontal.3")
                                    }//:BUTTON
                .sheet(isPresented: $isShowingFilter) {
                    FilterProductsView()
                        .onDisappear {
                            dashboardViewModel.searchAttributes.category = selectedCategory
                            dashboardViewModel.getListProducts()
                        }
                }
            )
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

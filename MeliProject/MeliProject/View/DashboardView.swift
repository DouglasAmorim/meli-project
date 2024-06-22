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
    @State var searchInput: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                HStack(spacing: 0) {
                    Image(systemName: "magnifyingglass")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                    
                    TextField("Search", text: $searchInput)
                        .onSubmit {
                            print("submit \(searchInput)")
                            self.dashboardViewModel.searchAttributes.search = searchInput
                            self.dashboardViewModel.getListProducts()
                        }
                }
                .background(Color.customGrayLight)
                .cornerRadius(16)
                .padding(.horizontal, 24)
                
                List {
                    switch dashboardViewModel.loadingState {
                    case .FAILURE:
                        Text("Error: \(self.dashboardViewModel.error?.description ?? " Unknown")")
                        
                    case .LOADING:
                        Text("Loading")
                        
                    case .LOADED:
                        ForEach(dashboardViewModel.products) { product in
                            NavigationLink(destination: ProductDetailView(product: product), label: {
                                ProductRowView(product: product)
                                    .padding(.vertical, 4)
                            })
                        }
                    }
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
                            print("VIEW - ONDISAPPEAR FILTER - selectedCategory")
                            if dashboardViewModel.searchAttributes.category != selectedCategory {
                                
                                print("VIEW - ONDISAPEAR FILTER - Call get list products again")
                                
                                dashboardViewModel.searchAttributes.category = selectedCategory
                                dashboardViewModel.getListProducts()
                            }
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

//
//  FilterProductsView.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import SwiftUI

struct FilterProductsView: View {
    @ObservedObject var filterProductsViewModel = FilterProductsViewModel(productsService: ProductsService())
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("selectedCategory") var selectedCategory: String = "MLA1055"
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterProductsViewModel.categories) { category in
                    
                    Button(action: {
                        selectedCategory = category.id
                        presentationMode.wrappedValue.dismiss()
                        print("category \(selectedCategory)")
                    }) {
                        Text(category.name)
                    }//:BUTTON
                    
                    // TODO: Return to the "past"
                }
            }
            .navigationTitle("Categories")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "xmark")
            })
        }
        .onAppear(perform: {
            print("VIEW: FilterProductsView - onAppear")
            filterProductsViewModel.getCategories()
        })
    }
}

struct FilterProductsView_Previews: PreviewProvider {
    static var previews: some View {
        FilterProductsView()
    }
}

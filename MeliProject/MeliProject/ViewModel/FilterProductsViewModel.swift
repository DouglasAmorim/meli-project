//
//  FilterProductsViewModel.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation

class FilterProductsViewModel: ObservableObject {
    private var productsService: ProductsService
    
    @Published var categories: [CategoryResponse] = []
    @Published var error: ErrorCustom? = nil
    
    init(productsService: ProductsService) {
        self.productsService = productsService
    }
    
    func getCategories() {
        self.productsService.getCategories { result in
            switch result {
            case .success(let categoriesResponse):
                self.categories = categoriesResponse
                
            case .failure(let error):
                self.error = error
            }
        }
    }
}

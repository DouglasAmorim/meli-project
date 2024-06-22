//
//  DashboardViewModel.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation

enum LoadingState: String {
    case LOADING, LOADED, FAILURE
}

class DashboardViewModel: ObservableObject {
    private var listProductsService: ProductsService
    
    var searchAttributes: ProductQueryStringModel = ProductQueryStringModel()
    
    @Published var products: [ProductModel] = []
    @Published var error: ErrorCustom? = nil
    @Published var loadingState: LoadingState = .LOADED
    
    init(listProductsService: ProductsService) {
        self.listProductsService = listProductsService
    }
    
    func getListProducts() {
        self.loadingState = .LOADING
        self.listProductsService.getListProducts(productQueryStringModel: self.searchAttributes) { result in
            switch result {
            case .success(let productsModel):
                print("VIEWMODEL - DashboardViewModel - success - items: \(productsModel.count)")
                self.products = productsModel
                self.loadingState = .LOADED
                
            case .failure(let errorCustom):
                print("VIEWMODEL - DashboardViewModel - error: \(errorCustom.description)")
                self.error = errorCustom
                self.loadingState = .FAILURE
            }
        }
    }
}

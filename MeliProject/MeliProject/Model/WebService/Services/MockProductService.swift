//
//  MockProductService.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation

class MockProductService: ProductsService {
    override func getCategories(_ result: @escaping (Result<[CategoryResponse], ErrorCustom>) -> Void) {
        var mockCategoryResponse: [CategoryResponse] = []
        let item = CategoryResponse()
        item.name = "name"
        item.id = "id"
        mockCategoryResponse.append(item)
        
        result(.success(mockCategoryResponse))
    }
    
    override func getListProducts(productQueryStringModel: ProductQueryStringModel = ProductQueryStringModel(), _ result: @escaping (Result<[ProductModel], ErrorCustom>) -> Void) {
        var mockProductModel: [ProductModel] = []
        let item = ProductModel()
        item.price = 22.22
        item.currency = "BRL"
        item.thumbnail = "thumbnail"
        item.title = "title"
        item.attributes = []
        
        mockProductModel.append(item)
        
        result(.success(mockProductModel))
    }
}

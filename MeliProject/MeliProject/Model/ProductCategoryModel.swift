//
//  ProductCategoryModel.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation

class ProductCategoryModel: Equatable, Codable {
    var category: String = "MLA1055"
    
    private enum CodingKeys: String, CodingKey {
        case category
    }
        
    static func == (lhs: ProductCategoryModel, rhs: ProductCategoryModel) -> Bool {
        return lhs.category == rhs.category
    }
}

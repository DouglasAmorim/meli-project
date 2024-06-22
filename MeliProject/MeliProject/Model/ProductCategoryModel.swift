//
//  ProductQueryStringModel.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation

class ProductQueryStringModel: Equatable, Codable {
    var category: String = "MLA1384"
    var search: String? = nil
    
    private enum CodingKeys: String, CodingKey {
        case category
        case search = "q"
    }
        
    static func == (lhs: ProductQueryStringModel, rhs: ProductQueryStringModel) -> Bool {
        return lhs.category == rhs.category &&
        lhs.search == rhs.search
    }
}

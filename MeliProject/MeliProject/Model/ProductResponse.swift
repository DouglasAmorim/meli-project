//
//  ProductResponse.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation

class ProductResponse: Codable, Equatable, Identifiable {
    var result: [ProductModel] = []
    
    private enum CodingKeys: String, CodingKey {
        case result
    }
        
    static func == (lhs: ProductResponse, rhs: ProductResponse) -> Bool {
        return lhs.result == rhs.result
    }
}

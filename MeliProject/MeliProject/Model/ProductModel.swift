//
//  ProductModel.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation

class ProductModel: Codable, Equatable, Identifiable {
    var id: String = ""
    var title: String = ""
    var price: Int = 0
    var currency: String = ""
    var thumbnail: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case id, title, price, thumbnail
        case currency = "currency_id"
    }
    
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id
    }
}

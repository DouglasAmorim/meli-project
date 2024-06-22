//
//  ProductAttributesModel.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation

class ProductAttributesModel: Codable, Equatable, Identifiable {
    var name: String? = ""
    var valueName: String? = ""
    var id: String? = ""
    var valueId: String? = ""
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case valueName = "value_name"
        case valueId = "value_id"
    }
    
    static func == (lhs: ProductAttributesModel, rhs: ProductAttributesModel) -> Bool {
        return lhs.name == rhs.name &&
        lhs.valueName == rhs.valueName &&
        lhs.id == rhs.id &&
        lhs.valueId == rhs.valueId
    }
}

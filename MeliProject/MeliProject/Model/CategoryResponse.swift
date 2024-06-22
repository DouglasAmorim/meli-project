//
//  CategoryResponse.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation

class CategoryResponse: Equatable, Codable, Identifiable {
    var id: String = ""
    var name: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case id, name
    }
        
    static func == (lhs: CategoryResponse, rhs: CategoryResponse) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name
    }
}

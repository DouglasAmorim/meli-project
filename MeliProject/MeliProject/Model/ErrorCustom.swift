//
//  ErrorCustom.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation
import Foundation

protocol ErrorProtocol: LocalizedError {
    var message: String? { get }
    var code: Int { get }
}

public class ErrorCustom: ErrorProtocol, Codable, Equatable {
    
    var message: String?
    var code: Int
    var description: String
    
    init(message: String? = nil, code: Int, description: String) {
        self.message = message
        self.code = code
        self.description = description
    }
    
    enum codingKeys: String, CodingKey {
        case message
        case code
        case description
    }
    
    public static func == (lhs: ErrorCustom, rhs: ErrorCustom) -> Bool {
        return lhs.code == rhs.code &&
        lhs.description == rhs.description &&
        lhs.message == rhs.message
    }
}

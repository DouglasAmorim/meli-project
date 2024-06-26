//
//  Endpoints.swift
//  MeliProject
//
//  Created by Douglas Amorim on 21/06/24.
//

import Foundation
/*
    Class made to facilitate adding and editing new and existing endpoints
 */
class Endpoint {
    static let API_BASE = (Bundle.main.infoDictionary!["API_BASE"]) as! String
    static let API_PATH = (Bundle.main.infoDictionary!["API_PATH"]) as! String
    
    static let apiBaseUrl = Endpoint.API_BASE + Endpoint.API_PATH
    
    static let search = apiBaseUrl + "search"
    
    static let categories = apiBaseUrl + "categories"
}

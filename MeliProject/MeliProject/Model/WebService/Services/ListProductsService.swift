//
//  ListProductsService.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation
import Alamofire

class ListProductsService {
    func getListProducts(_ result: @escaping (Result<[ProductModel], ErrorCustom>) -> Void) {
        WsRequestInterceptor.shared.manager.request(Endpoint.search, method: .get, parameters: nil, encoding: URLEncoding.default)
            .validate()
            .handleResponse { response in
                switch response {
                case .success(let data):
                    
                    do {
                        let response = try JSONDecoder().decode(ProductResponse.self, from: data)
                        result(.success(response.result))
                        
                    } catch let error {
                        let errorCustom = ErrorCustom(code: 1, description: error.localizedDescription)
                        result(.failure(errorCustom))
                    }
                    
                case .failure(let error):
                    guard let errorCustom = error as? ErrorCustom else {
                        let errorCustom = ErrorCustom(code: 0, description: error.localizedDescription)
                        result(.failure(errorCustom))
                        return
                    }
                    
                    result(.failure(errorCustom))
                }
            }
            .resume()
    }
}

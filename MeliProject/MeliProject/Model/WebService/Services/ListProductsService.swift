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
        print("SERVICE - endpoint: \(Endpoint.search) method: GET")
        
        do {
            let parameterData = try JSONEncoder().encode(ProductCategoryModel())
            let parameter = try JSONSerialization.jsonObject(with: parameterData, options: []) as? [String: AnyObject]
            
            WsRequestInterceptor.shared.manager.request(Endpoint.search, method: .get, parameters: parameter, encoding: URLEncoding.default)
                .validate()
                .handleResponse { response in
                    switch response {
                    case .success(let data):
                        print("SERVICE - ListProduct - get - success")
                        do {
                            let response = try JSONDecoder().decode(ProductResponse.self, from: data)
                            result(.success(response.result))
                            
                        } catch let error {
                            print("SERVICE - ListProduct - get - error Decode \(error.localizedDescription)")
                            
                            let errorCustom = ErrorCustom(code: 1, description: error.localizedDescription)
                            result(.failure(errorCustom))
                        }
                        
                    case .failure(let error):
                        print("SERVICE - ListProduct - get - error \(error.localizedDescription)")
                        guard let errorCustom = error as? ErrorCustom else {
                            let errorCustom = ErrorCustom(code: 0, description: error.localizedDescription)
                            result(.failure(errorCustom))
                            return
                        }
                        
                        result(.failure(errorCustom))
                    }
                }
                .resume()
            
            
        } catch let error {
            print("SERVICE - ListProduct - error Encode \(error.localizedDescription)")
            
            let errorCustom = ErrorCustom(code: 2, description: error.localizedDescription)
            result(.failure(errorCustom))
        }
    }
}

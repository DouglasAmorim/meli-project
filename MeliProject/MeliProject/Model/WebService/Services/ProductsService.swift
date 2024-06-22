//
//  ListProductsService.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation
import Alamofire

class ProductsService {
    func getCategories(_ result: @escaping (Result<[CategoryResponse], ErrorCustom>) -> Void) {
        
        WsRequestInterceptor.shared.manager.request(Endpoint.categories, method: .get, parameters: nil, encoding: URLEncoding.default)
            .validate()
            .handleResponse { response in
                switch response {
                case .success(let data):
                    do {
                        let response = try JSONDecoder().decode([CategoryResponse].self, from: data)
                        result(.success(response))
                        
                    } catch let error {
                        print("SERVICE - Categories - get - error Decode \(error.localizedDescription)")
                        
                        let errorCustom = ErrorCustom(code: 1, description: error.localizedDescription)
                        result(.failure(errorCustom))
                    }
                    
                case .failure(let error):
                    print("SERVICE - categories - get - error \(error.localizedDescription)")
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
    
    func getListProducts(productQueryStringModel: ProductQueryStringModel = ProductQueryStringModel(), _ result: @escaping (Result<[ProductModel], ErrorCustom>) -> Void) {
        
        do {
            let parameterData = try JSONEncoder().encode(productQueryStringModel)
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

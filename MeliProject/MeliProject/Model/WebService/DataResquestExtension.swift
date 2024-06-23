//
//  DataResquestExtension.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation
import Alamofire

/*
Extension of DataRequest
 implements a method which handles the api responses to the service
 */
extension DataRequest {
    public func handleResponse(_ completion: @escaping (Result<Data, Error>) -> Void) -> Self {
        return responseData { dataResponse in
             
            guard let statusCode = dataResponse.response?.statusCode else {
                let erro = ErrorCustom(code: 0, description: "Exception: No Http Status Code")
                completion(.failure(erro))
                return
            }
            
            print("DATA REQUEST - Request URL: \(dataResponse.request?.url)")
            print("DATAREQUEST - response status code \(statusCode)")
            
            switch statusCode {
            case 200 ... 299:
                
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                    
                case .failure(let error):
                    print("DATAREQUEST - response error \(statusCode) \(error.localizedDescription)")
                    let errorCustom = ErrorCustom(message: error.errorDescription, code: error.responseCode ?? 0, description: error.localizedDescription)
                    
                    completion(.failure(errorCustom))
                }
                
            default:
                // TODO: Decode Error
                print("DATAREQUEST - response error \(statusCode)")
                let errorCustom = ErrorCustom(message: "Exception:", code: 0, description: "Description")
                
                completion(.failure(errorCustom))
            }
            
        }
    }
}

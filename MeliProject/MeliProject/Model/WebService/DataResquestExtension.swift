//
//  DataResquestExtension.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import Foundation
import Alamofire

extension DataRequest {
    public func handleResponse(_ completion: @escaping (Result<Data, Error>) -> Void) -> Self {
        return responseData { dataResponse in
             
            guard let statusCode = dataResponse.response?.statusCode else {
                let erro = ErrorCustom(code: 0, description: "Exception: No Http Status Code")
                completion(.failure(erro))
                return
            }
            
            switch statusCode {
            case 200 ... 299:
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                    
                case .failure(let error):
                    
                    let errorCustom = ErrorCustom(message: error.errorDescription, code: error.responseCode ?? 0, description: error.localizedDescription)
                    
                    completion(.failure(errorCustom))
                }
                
            default:
                // TODO: Decodificar erro
                let errorCustom = ErrorCustom(message: "Exception:", code: 0, description: "Description")
                
                completion(.failure(errorCustom))
            }
            
        }
    }
}

//
//  WsRequestInterceptor.swift
//  MeliProject
//
//  Created by Douglas Amorim on 21/06/24.
//

import Foundation
import Alamofire

/*
 RequestInterceptor implementation
 class made to hel the configuration of 'Session' on alamofire
 Also can be used to setuo needed tokens in adapter before the api call, and treat with retries if needed
 */
class WsRequestInterceptor: RequestInterceptor {
    static let TIMEOUT: TimeInterval = 120
    static let shared = WsRequestInterceptor()
    
    lazy var manager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = WsRequestInterceptor.TIMEOUT
        
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        
        let manager = Session(configuration: configuration, delegate: Session.default.delegate, interceptor: self)
        
        return manager
    }()
    
    func adapt(_ urlRequest: URLRequest, for session: Alamofire.Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Alamofire.Request, for session: Alamofire.Session, dueTo error: Error, completion: @escaping (Alamofire.RetryResult) -> Void) {
        
        completion(.doNotRetry)
    }
}

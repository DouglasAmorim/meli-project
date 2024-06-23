//
//  ProductServiceTests.swift
//  MeliProjectTests
//
//  Created by Douglas Amorim on 22/06/24.
//

import XCTest

@testable import MeliProject
@testable import Pods_MeliProject

import Alamofire
import Mocker

final class ProductServiceTests: XCTestCase {
    var configuration = URLSessionConfiguration.default
    var session: Session = Session()
    var productService: ProductsService?
    
    override func setUpWithError() throws {
        self.configuration = URLSessionConfiguration.default
        self.configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        self.session = Session(configuration: self.configuration, delegate: Session.default.delegate)
        self.productService = ProductsService(session: self.session)
    }

    override func tearDownWithError() throws {
        self.productService = nil
    }

    func testGetCategories() throws {
        var mockResponse: [CategoryResponse] = []
        let item = CategoryResponse()
        
        item.name = "category"
        item.id = "666666"
        
        mockResponse.append(item)
        
        guard let apiEndpoint: URL = URL(string: Endpoint.categories) else {
            XCTFail()
            return
        }
        
        guard let mockedData = try? JSONEncoder().encode(mockResponse) else {
            XCTFail()
            return
        }
        
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()
        
        self.productService?.getCategories { response in
            switch response {
            case .success(let categories):
                XCTAssertEqual(mockResponse, categories)
                
            case .failure(let error):
                XCTFail(error.description)
            }
            
        }
    }
    
    func testGetListProducts() throws {
        var mockResponse: [ProductModel] = []
        let item = ProductModel()
        item.currency = "BRL"
        item.price = 10.00
        item.thumbnail = "thumbnail"
        item.title = "title"
        item.attributes = []
        
        mockResponse.append(item)
        
        guard let apiEndpoint: URL = URL(string: Endpoint.search) else {
            XCTFail()
            return
        }
        
        guard let mockedData = try? JSONEncoder().encode(mockResponse) else {
            XCTFail()
            return
        }
        
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()
        
        self.productService?.getListProducts { response in
            switch response {
            case .success(let products):
                XCTAssertEqual(mockResponse, products)
            case .failure(let error):
                XCTFail(error.description)
            }
            
        }
    }
}

//
//  DashboardViewModelTests.swift
//  MeliProjectTests
//
//  Created by Douglas Amorim on 22/06/24.
//

import XCTest
@testable import MeliProject
@testable import Pods_MeliProject

final class DashboardViewModelTests: XCTestCase {
    private var mockProductService: MockProductService?
    private var viewModel: DashboardViewModel?
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        self.mockProductService = MockProductService()
        
        if let mock = self.mockProductService {
            self.viewModel = DashboardViewModel(listProductsService: mock)
        }
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
        self.mockProductService = nil
    }

    func testGetListProducts() throws {
        guard let viewModel = self.viewModel else {
            XCTFail()
            return
        }
        
        var mockProductModel: [ProductModel] = []
        let item = ProductModel()
        item.price = 22.22
        item.currency = "BRL"
        item.thumbnail = "thumbnail"
        item.title = "title"
        item.attributes = []
        
        mockProductModel.append(item)
        
        viewModel.getListProducts()
        
        XCTAssertEqual(viewModel.products, mockProductModel)
        
    }
}

//
//  FilterProductsViewModelTests.swift
//  MeliProjectTests
//
//  Created by Douglas Amorim on 22/06/24.
//

import XCTest
@testable import MeliProject
@testable import Pods_MeliProject

final class FilterProductsViewModelTests: XCTestCase {
    private var mockProductService: MockProductService?
    private var viewModel: FilterProductsViewModel?
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        self.mockProductService = MockProductService()
        
        if let mock = self.mockProductService {
            self.viewModel = FilterProductsViewModel(productsService: mock)
        }
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
        self.mockProductService = nil
    }


    func testGetCategories() throws {
        guard let viewModel = self.viewModel else {
            XCTFail()
            return
        }
        
        var mockCategoryResponse: [CategoryResponse] = []
        let item = CategoryResponse()
        item.name = "name"
        item.id = "id"
        mockCategoryResponse.append(item)
        
        viewModel.getCategories()
        
        XCTAssertEqual(viewModel.categories, mockCategoryResponse)
    }
}

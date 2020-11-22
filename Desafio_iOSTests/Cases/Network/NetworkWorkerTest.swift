//
//  NetworkWorker.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 21/11/20.
//

import XCTest

class NetworkWorkerTest: XCTestCase {
    
    var sut: NetworkWorkerMock!
    
    override func setUpWithError() throws {
        sut = NetworkWorkerMock()
    }

    override func tearDownWithError() throws {
        
    }
    
    //MARK: Utils
    func createRequest() -> URLRequest {
        let route = NetworkRoutes(routeType: .sandboxProducts, newURL: nil)
        let method = HTTPMethods.get
        let newRequest = sut.setupRequest(route: route, method: method)
        return newRequest!
    }
    
    func createResponse() -> HTTPURLResponse {
        let response = HTTPURLResponse(url: URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        return response!
    }

    //MARK: Tests
    func testNetworkWorker_whenInitialized_emptyConstrutor_isNotNil(){
        //when
        let networkWorker = NetworkWorkerMock()
        
        //then
        XCTAssertNotNil(networkWorker)
    }
    
    func testNetworkWorker_whenInitialized_emptyConstrutor_urlSessionCreated(){
        //when
        let networkWorker = NetworkWorkerMock()
    
        //then
        XCTAssertNotNil(networkWorker)
    }
    
    func testNetworkRoutes_whenInitialized_sandboxProductType_routeIsCorrect(){
        //when
        let route = NetworkRoutes(routeType: .sandboxProducts, newURL: nil)
        
        //then
        XCTAssertEqual(route.finalURL, "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products")
    }
    
    func testNetworkRoutes_whenInitialized_newUrl_routeIsCorrect(){
        //when
        let route = NetworkRoutes(routeType: nil, newURL: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products")
        
        //then
        XCTAssertEqual(route.finalURL, "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products")
    }
    
    func testNetworkWorker_whenMakeGetRequest_requestIsPerformed_responseIsCorrect() {
        //given
        let route = NetworkRoutes(routeType: .sandboxProducts, newURL: nil)
        
        //when
        let expectation = XCTestExpectation(description: "Package received")

        sut.makeGetRequest(route: route) { (response : Result<PackageMock, Error>) in
            switch response {
            case .success(_):
                expectation.fulfill()
            default:
                return
            }
        }
        
        //then
        wait(for: [expectation], timeout: 0)
        
    }
    
    func testNetworkWorker_whenSetupRequest_requestIsCreated_requestIsCorrect() {
        //given
        let route = NetworkRoutes(routeType: .sandboxProducts, newURL: nil)
        let method = HTTPMethods.get
        var oldRequest = URLRequest(url: URL(string: route.finalURL)!)
        oldRequest.httpMethod = method.rawValue
        
        //When
        let newRequest = sut.setupRequest(route: route, method: method)
        
        XCTAssertEqual(newRequest, oldRequest)
    }
    
    func testNetworkWorker_whenHandleRequest_responseIsReceived_errorHandled() {
        //given
        let error = NetworkErrors.responseParserError
        let result : Result<PackageMock, Error> = sut.handleGetRequest(data: nil, response: nil, error: error)
        
        //when
        var errorReceived: NetworkErrors?
        switch result {
        case .failure(let error):
            errorReceived = error as? NetworkErrors
        default:
            return
        }
        
        //then
        XCTAssertEqual(errorReceived, error)
    }
    
    func testNetworkWorker_whenHandleRequest_responseIsReceived_dataNilHandled() {
        //given
        let error = NetworkErrors.responseDataIsNil
        let result : Result<PackageMock, Error> = sut.handleGetRequest(data: nil, response: self.createResponse(), error: nil)
        
        //when
        var errorReceived: NetworkErrors?
        switch result {
        case .failure(let error):
            errorReceived = error as? NetworkErrors
        default:
            return
        }
        
        //then
        XCTAssertEqual(errorReceived, error)
    }
    
    func testNetworkWorker_whenHandleRequest_responseIsReceived_responseStatusCodeHandled() {
        //given
        let error = NetworkErrors.responseStatusError
        let result : Result<PackageMock, Error> = sut.handleGetRequest(data: nil, response: nil, error: nil)
        
        //when
        var errorReceived: NetworkErrors?
        switch result {
        case .failure(let error):
            errorReceived = error as? NetworkErrors
        default:
            return
        }
        
        //then
        XCTAssertEqual(errorReceived, error)
    }
 

}

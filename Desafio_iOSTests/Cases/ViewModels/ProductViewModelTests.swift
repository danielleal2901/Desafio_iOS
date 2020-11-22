//
//  ProductViewModelMock.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import XCTest

class ProductViewModelTests: XCTestCase {

    var sut: ProductViewModelMock!

    override func setUpWithError() throws {
        sut = ProductViewModelMock()
    }

    override func tearDownWithError() throws {

    }
    
    func testProductViewModel_whenInitialized_emptyConstrutor_isNotNil(){
        
        //when
        let productVM = ProductViewModelMock()
        
        //then
        XCTAssertNotNil(productVM)
    }
    
    func testProductViewModel_whenInitialized_emptyConstrutor_networkWorkerWasInitialized(){
        
        //when
        let productVM = ProductViewModelMock()
        
        //then
        XCTAssertNotNil(productVM.networkWorker)
        
    }
    
    func testProductViewModel_whenFetchImage_fetchImage_imageReceived(){
        //given
        var image: UIImage?
        
        //when
        sut.fetchImage(imageURL: URL(string: "https://s3-sa-east-1.amazonaws.com/digio-exame/Product_banner.png")!) { (result) in
            
            switch result {
            case .success(let receivedImage):
                image = receivedImage
            default:
                return
            }
        }
        
        //Then
        XCTAssertNotNil(image)
        
    }

}

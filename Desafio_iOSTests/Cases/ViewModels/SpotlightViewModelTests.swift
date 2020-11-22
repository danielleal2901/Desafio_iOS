//
//  SpotlightViewModelTest.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import XCTest

class SpotlightViewModelTests: XCTestCase {

    var sut: SpotlightViewModelMock!

    override func setUpWithError() throws {
        sut = SpotlightViewModelMock()
    }

    override func tearDownWithError() throws {

    }
    
    func testSpotlightViewModel_whenInitialized_emptyConstrutor_isNotNil(){
        
        //when
        let spotlightVM = SpotlightViewModelMock()
        
        //then
        XCTAssertNotNil(spotlightVM)
    }
    
    func testSpotlightViewModel_whenInitialized_emptyConstrutor_networkWorkerWasInitialized(){
        
        //when
        let spotlightVM = SpotlightViewModelMock()
        
        //then
        XCTAssertNotNil(spotlightVM.networkWorker)
        
    }
    
    func testSpotlightViewModel_whenFetchImage_fetchImage_imageReceived(){
        //given
        var image: UIImage?
        
        //when
        sut.fetchImage(imageURL: URL(string: "https://s3-sa-east-1.amazonaws.com/digio-exame/Spotlight_banner.png")!) { (result) in
            
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

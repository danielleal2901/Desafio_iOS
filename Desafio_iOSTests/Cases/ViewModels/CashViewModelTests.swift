//
//  ViewModelTests.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import XCTest
@testable import Desafio_iOS

class CashViewModelTests: XCTestCase {
    
    var sut: CashViewModelMock!

    override func setUpWithError() throws {
        sut = CashViewModelMock()
    }

    override func tearDownWithError() throws {

    }
    
    func testCashViewModel_whenInitialized_emptyConstrutor_isNotNil(){
        
        //when
        let cashVM = CashViewModel()
        
        //then
        XCTAssertNotNil(cashVM)
    }
    
    func testCashViewModel_whenInitialized_emptyConstrutor_networkWorkerWasInitialized(){
        
        //when
        let cashVM = CashViewModel()
        
        //then
        XCTAssertNotNil(cashVM.networkWorker)
        
    }
    
    func testCashViewModel_whenFetchImage_fetchImage_imageReceived(){
        //given
        var image: UIImage?
        
        //when
        sut.fetchImage(imageURL: URL(string: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png")!) { (result) in
            
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

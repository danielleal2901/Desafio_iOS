//
//  MainViewModelTests.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import XCTest
@testable import Desafio_iOS

class MainViewModelTests: XCTestCase {

    var sut: MainViewModelMock!

    override func setUpWithError() throws {
        sut = MainViewModelMock()
    }

    override func tearDownWithError() throws {

    }
    
    func testMainViewModelViewModel_whenInitialized_emptyConstrutor_isNotNil(){
        
        //when
        let mainViewModelVM = MainViewModelMock()
        
        //then
        XCTAssertNotNil(mainViewModelVM)
    }
    
    func testMainViewModelViewModel_whenInitialized_emptyConstrutor_networkWorkerWasInitialized(){
        
        //when
        let mainViewModelVM = MainViewModelMock()
        
        //then
        XCTAssertNotNil(mainViewModelVM.networkWorker)
        
    }
    
    func testMainViewModelViewModel_whenFetchPackage_fetchPackage_packageReceived(){
        //given
        var package: PackageMock?
        
        //when
        sut.fetchPackage { (result) in
            switch result {
            case .success(let receivedPackage):
                package = receivedPackage as? PackageMock
            default:
                return
            }
        }
        
        //Then
        XCTAssertNotNil(package)
        
    }
    
    func testMainViewModelViewModel_whenFetchPackage_fetchPackage_cashReceived(){
        //given
        let titleCash = PackageMock().cash.title
        
        //when
        var titleCashReceived : String?
        sut.fetchPackage { (result) in
            switch result {
            case .success(let receivedPackage):
                if let package = receivedPackage as? PackageMock {
                    titleCashReceived = package.cash.title
                }
            default:
                return
            }
        }
        
        //Then
        XCTAssertEqual(titleCashReceived, titleCash)
        
    }

    func testMainViewModelViewModel_whenFetchPackage_fetchPackage_productsReceived(){
        //given
        let productsCount = PackageMock().products.count
        
        //when
        var productsReceivedCount : Int?
        sut.fetchPackage { (result) in
            switch result {
            case .success(let receivedPackage):
                if let package = receivedPackage as? PackageMock {
                    productsReceivedCount = package.products.count
                }
            default:
                return
            }
        }
        
        //Then
        XCTAssertEqual(productsReceivedCount, productsCount)
        
    }
    
    func testMainViewModelViewModel_whenFetchPackage_fetchPackage_spotlightsReceived(){
        //given
        let spotlightsCount = PackageMock().spotlight.count
        
        //when
        var spotlightsReceivedCount : Int?
        sut.fetchPackage { (result) in
            switch result {
            case .success(let receivedPackage):
                if let package = receivedPackage as? PackageMock {
                    spotlightsReceivedCount = package.spotlight.count
                }
            default:
                return
            }
        }
        
        //Then
        XCTAssertEqual(spotlightsReceivedCount, spotlightsCount)
        
    }
}

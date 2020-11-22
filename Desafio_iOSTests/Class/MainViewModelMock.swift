//
//  MainViewModelMock.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import Foundation
@testable import Desafio_iOS

class MainViewModelMock : ViewModelProtocol{

    let networkWorker : NetworkWorkerProtocol = NetworkWorkerMock()
    
    func fetchPackage(completion: @escaping (Result<Codable?, Error>) -> ()) {
        completion(.success(PackageMock()))
    }
}

//
//  NetworkWorkerMock.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import Foundation
@testable import Desafio_iOS

class NetworkWorkerMock: NetworkWorkerProtocol{
    var urlSession: URLSession

    init() {
        urlSession = URLSession.shared
    }
    
    func makeGetRequest<T: Decodable>(route: NetworkRoutes, completion: @escaping (Result<T, Error>) -> ()) {
        completion(.success(PackageMock() as! T))
    }
    
    func makeGetImageRequest(route: NetworkRoutes, completion: @escaping (Result<Data, Error>) -> ()) {
        completion(.success(Data()))
    }
    
}

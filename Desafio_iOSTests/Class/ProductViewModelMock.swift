//
//  ProductViewModelMock.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import Foundation
import UIKit
@testable import Desafio_iOS

class ProductViewModelMock : ViewModelProtocol{
    var networkWorker : NetworkWorkerProtocol = NetworkWorkerMock()
    
    func fetchImage(imageURL: URL, completion: @escaping (Result<UIImage?, Error>) -> ()) {
        completion(.success(UIImage()))
    }
    
}

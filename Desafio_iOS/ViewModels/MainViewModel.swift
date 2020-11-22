//
//  MainViewModel.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation
import Combine

/// ViewModel da View principal.
class MainViewModel : ViewModelProtocol{
    
    //MARK: Variables
    let networkWorker: NetworkWorkerProtocol  = NetworkWorker()

    private var package : Package? {
        didSet{
            guard let package = self.package else {return}
            subject?.send(package)
        }
    }
    
    lazy var publisher: AnyPublisher<Package, Never>? = {
        return self.subject!.eraseToAnyPublisher()
    }()
    
    private (set) var subject: PassthroughSubject<Package, Never>? = PassthroughSubject<Package, Never>()
    
    func fetchPackage (completion: @escaping (Result<Codable?, Error>) -> () = { _ in }) {
        let route = NetworkRoutes(routeType: .sandboxProducts, newURL: nil)
        networkWorker.makeGetRequest(route: route) { (result : Result<Package, Error>) in
            switch result {
            case .success(let package):
                self.package = package
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

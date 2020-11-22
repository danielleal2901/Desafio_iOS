//
//  ModelProtocol.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 22/11/20.
//

import Foundation
import UIKit

/// Protocolo que define as View Models
protocol ViewModelProtocol : class {
    var networkWorker : NetworkWorkerProtocol {get}
    
    /// Método responsável por solicitar ao worker uma requisição http para buscar uma imagem
    /// - Parameters:
    ///   - imageURL: url da imagem que será buscada
    ///   - completion: completion com o resultado da requisição
    func fetchImage(imageURL: URL, completion: @escaping (Result<UIImage?, Error>) -> ())
    
    
    /// Método responsável por solicitar ao worker uma requisição para buscar um package que seja "Codable".
    /// - Parameter completion: completion com o resultado da requisição
    func fetchPackage (completion: @escaping (Result<Codable?, Error>) -> ())
}

extension ViewModelProtocol{
    func fetchImage(imageURL: URL, completion: @escaping (Result<UIImage?, Error>) -> ()){
        
        let route = NetworkRoutes(routeType: nil, newURL: imageURL.absoluteString)
        networkWorker.makeGetImageRequest(route: route) { (result) in
            switch (result){
            case .success(let image):
                DispatchQueue.main.async {
                    completion(.success(UIImage(data: image)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchPackage (completion: @escaping (Result<Codable?, Error>) -> ())
    {
        
    }
}

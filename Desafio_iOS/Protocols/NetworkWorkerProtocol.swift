//
//  NetworkWorkerProtocol.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 22/11/20.
//

import Foundation

/// Protocolo que define um Network Worker, responsável por fazer as requisições na rede.
protocol NetworkWorkerProtocol : class {
    var urlSession: URLSession {get}
    
    /// Método que realiza uma requisição HTTP do tipo GET e retorna um tipo genérico.
    /// - Parameters:
    ///   - route: Rota que define a URL da requisição.
    ///   - completion: Completion com o resultado da requisição
    func makeGetRequest<T: Decodable>(route: NetworkRoutes, completion: @escaping (Result<T, Error>) -> ())
    
    
    /// Método que realiza uma requisição HTTP do tipo GET para buscar uma imagem.
    /// - Parameters:
    ///   - route: Rota que define a URL da requisição.
    ///   - completion: Completion com o resultado da requisição
    func makeGetImageRequest(route: NetworkRoutes, completion: @escaping (Result<Data, Error>) -> ())
}

extension NetworkWorkerProtocol {
    /// Método que configura uma URL Request
    /// - Parameters:
    ///   - route: Rota com a url da requisição
    ///   - method: Método HTTP da requisição.
    /// - Returns: Retorna uma URLRequest caso tenha conseguido setar uma, ou nil caso não tenha conseguido criar uma URL Request.
    func setupRequest(route: NetworkRoutes, method: HTTPMethods) -> URLRequest? {
        guard let url = URL(string: route.finalURL) else {return nil}
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
    
    /// Método que lida com o resultado de uma requisição do tipo GET.
    /// - Parameters:
    ///   - data: Data recebido da response
    ///   - response: Response recebido pela requisição
    ///   - error: Erro rebido pela requisição
    /// - Returns: Retorna um tipo genérico informado na função, ou um erro caso tenha encontrado algum problema.
    func handleGetRequest<T: Decodable>(data: Data?, response: URLResponse?, error: Error?) -> Result<T, Error> {
        if let error = error{
            return .failure(error)
        }
        else {
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                return .failure(NetworkErrors.responseStatusError)
            }
            if let data = data {
                do {
                    let entity = try JSONDecoder().decode(T.self, from: data)
                    return .success(entity)
                } catch {
                    return .failure(NetworkErrors.responseParserError)
                }
            }else {
                return .failure(NetworkErrors.responseDataIsNil)
            }
        }
    }
    
    /// Método que lida com o resultado de uma requisição do tipo GET e busca uma imagem.
    /// - Parameters:
    ///   - data: Data recebido da response
    ///   - response: Response recebido pela requisição
    ///   - error: Erro rebido pela requisição
    /// - Returns: Retorna o data da imagem, ou um erro caso tenha encontrado algum problema.
    func handleGetImageRequest(data: Data?, response: URLResponse?, error: Error?) -> Result<Data, Error> {
        if let error = error{
            return .failure(error)
        }
        else {
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                return .failure(NetworkErrors.responseStatusError)
            }
            if let data = data {
                return .success(data)
            }else {
                return .failure(NetworkErrors.responseDataIsNil)
            }
        }
    }
    
    /// Método responsável por realizar uma requisição do tipo GET.
    /// - Parameters:
    ///   - route: Rota que define a URL da requisição
    ///   - completion: Completion com o resultado da requisição
    /// - Returns:
    func makeGetRequest<T: Decodable>(route: NetworkRoutes, completion: @escaping (Result<T, Error>) -> ()){
        guard let request = setupRequest(route: route, method: .get) else {
            completion(.failure(NetworkErrors.requestIsNil))
            return
        }
        
        urlSession.dataTask(with: request) { (data, response, error) in
            completion(self.handleGetRequest(data: data, response: response, error: error))
        }.resume()

    }
    
    /// Método responsável por realizar uma requisição do tipo GET que busca uma imagem.
    /// - Parameters:
    ///   - route: Rota que define a URL da requisição
    ///   - completion: Completion com o resultado da requisição
    /// - Returns: 
    func makeGetImageRequest(route: NetworkRoutes, completion: @escaping (Result<Data, Error>) -> ()){
        guard let request = setupRequest(route: route, method: .get) else {
            completion(.failure(NetworkErrors.requestIsNil))
            return
        }
        
        urlSession.dataTask(with: request) { (data, response, error) in
            completion(self.handleGetImageRequest(data: data, response: response, error: error))
        }.resume()

    }
    
}

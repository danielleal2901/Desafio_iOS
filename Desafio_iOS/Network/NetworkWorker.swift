//
//  NetworkWorker.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation

class NetworkWorker : NetworkWorkerProtocol {
    
    let urlSession : URLSession
        
    init() {
        self.urlSession = URLSession.shared
    }
    
}

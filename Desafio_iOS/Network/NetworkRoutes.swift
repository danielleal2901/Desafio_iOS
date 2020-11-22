//
//  NetworkRoutes.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation

/// Configura as rotas de Network
public struct NetworkRoutes {
    
    //MARK: Variáveis
    enum RoutesTypes: String {
        case sandboxProducts = "sandbox/products"
    }
    
    let mainURL = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/"
    
    let routeType : RoutesTypes? 
    let newURL : String?

    var finalURL : String {
        if let route = self.routeType {
            return mainURL + route.rawValue
        }else {
            if let url = newURL{
                return url
            }
        }
        return ""
    }
    
    
}

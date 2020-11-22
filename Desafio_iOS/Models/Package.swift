//
//  Package.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation

/// Struct que define o Package que contém todos as outras entidades.
struct Package : Codable {
    
    //MARK: Variáveis
    let products : [Product]
    let spotlight : [Spotlight]
    let cash : Cash
    
    enum CodingKeys: String, CodingKey{
        case products
        case spotlight
        case cash
    }
}

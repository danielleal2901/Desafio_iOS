//
//  Product.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation

/// Struct que define um Produto.
struct Product : Codable {
    
    //MARK: Variáveis
    let name : String
    let imageURL : URL
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name, imageURL
        case productDescription = "description"
    }
}

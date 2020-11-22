//
//  Cash.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation

/// Struct que define um Cash.
struct Cash : Codable {
    
    //MARK: Variáveis
    let title : String
    let bannerURL : URL
    let cashDescription : String
    
    enum CodingKeys: String, CodingKey {
        case title, bannerURL
        case cashDescription = "description"
    }
}

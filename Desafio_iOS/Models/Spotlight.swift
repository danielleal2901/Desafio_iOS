//
//  Spotlight.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation

/// Struct que define um Spotlight.
struct Spotlight : Codable {
    
    //MARK: Variáveis
    let name : String
    let bannerURL : URL
    let spotlightDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name, bannerURL
        case spotlightDescription = "description"
    }
}


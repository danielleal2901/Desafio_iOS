//
//  NetworkErrors.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation

/// Enum com os possíveis tipos de Error de Network
enum NetworkErrors: String, Error  {
    case requestIsNil
    case responseStatusError
    case responseParserError
    case responseDataIsNil
}

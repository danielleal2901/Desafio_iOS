//
//  PackageMock.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation

struct PackageMock : Codable{
    var products : [ProductMock] = [ProductMock()]
    var spotlight : [SpotlightMock] = [SpotlightMock()]
    var cash : CashMock = CashMock()
}

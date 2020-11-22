//
//  ProductMock.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import Foundation

struct ProductMock : Codable {
    var name : String = "Product"
    var imageURL : URL = URL(string: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png")!
    var productDescription: String = "Com o e-Gift Card Xbox vocÃª adquire crÃ©ditos para comprar games, mÃºsica, filmes, programas de TV e muito mais!"
}

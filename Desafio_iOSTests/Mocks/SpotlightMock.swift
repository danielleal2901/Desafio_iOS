//
//  SpotlightMock.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import Foundation

struct SpotlightMock : Codable{
    var name : String = "Recarga"
    var bannerURL : URL = URL(string: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png")!
    var spotlightDescription: String = "Agora ficou mais facil colocar creditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda segurancaa e praticidade que voce procura."
}

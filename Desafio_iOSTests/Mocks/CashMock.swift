//
//  CashMock.swift
//  Desafio_iOSTests
//
//  Created by Daniel Leal on 22/11/20.
//

import Foundation

struct CashMock : Codable{
    var title : String = "digio Cash"
    var bannerURL : URL = URL(string: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png")!
    var cashDescription : String = "Dinheiro na conta sem complicaÃ§Ã£o. Transfira parte do limite do seu cartÃ£o para sua conta."
}

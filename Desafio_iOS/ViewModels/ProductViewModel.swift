//
//  ProductViewModel.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation
import UIKit

/// ViewModel de uma View de Produto
class ProductViewModel : ViewModelProtocol{
    //MARK: Variáveis
    let networkWorker: NetworkWorkerProtocol = NetworkWorker()
}

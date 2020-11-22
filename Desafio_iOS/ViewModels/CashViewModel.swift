//
//  CashVM.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation
import UIKit

/// ViewModel de uma view de Cash.
class CashViewModel : ViewModelProtocol {
    //MARK: Variáveis
    let networkWorker: NetworkWorkerProtocol = NetworkWorker()
}

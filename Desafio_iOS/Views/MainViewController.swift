//
//  ViewController.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import UIKit
import Combine

/// View Principal
class MainViewController: UIViewController {
    
    //MARK: Variables
    let mainVM = MainViewModel()
    private var subscriber: AnyCancellable?
    private var package: Package? {
        didSet {
            guard let package = self.package else {return}
            self.cashView.setupCashView(cash: package.cash)
            self.productsView.products = package.products
            self.spotlightView.spotlights = package.spotlight
        }
    }
    
    //MARK: Views
    let cashView = CashView()
    let productsView = ProductsView()
    let spotlightView = SpotlightView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        defer {
            self.subscriber = mainVM.publisher?.receive(on: DispatchQueue.main).sink(receiveValue: { (package) in
                self.package = package
            })
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.mainVM.fetchPackage()
        self.setupSpotlightsCollection()
        self.setupCash()
        self.setupProductsView()
    }
    
    /// Configura a view de Spotlights
    func setupSpotlightsCollection() {
        self.view.addSubview(self.spotlightView)
        
        spotlightView.translatesAutoresizingMaskIntoConstraints = false
        spotlightView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        spotlightView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        spotlightView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        spotlightView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.1).isActive = true
        
        self.spotlightView.setupSpotlightView(viewSize: CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 0.3))
    }
    
    /// Configura a view de Cash
    func setupCash() {
        self.view.addSubview(self.cashView)

        cashView.translatesAutoresizingMaskIntoConstraints = false
        cashView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cashView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        cashView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        cashView.topAnchor.constraint(equalTo: self.spotlightView.bottomAnchor, constant: self.view.frame.height * 0.05).isActive = true
        
    }
    
    /// Configura a view de Produtos
    func setupProductsView() {
        self.view.addSubview(self.productsView)
        
        productsView.translatesAutoresizingMaskIntoConstraints = false
        productsView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        productsView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        productsView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
        productsView.topAnchor.constraint(equalTo: self.cashView.bottomAnchor, constant: self.view.frame.height * 0.05).isActive = true
        
        self.productsView.setupProductsView(viewSize: CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 0.25))
    }


}


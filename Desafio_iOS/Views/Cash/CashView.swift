//
//  CashView.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation
import UIKit

/// View de Cash
class CashView: UIView {
    
    //MARK: Variáveis
    let titleView = UILabel()
    let imageView = UIImageView()
    let activityIndicator = UIActivityIndicatorView()
    
    let cashVM = CashViewModel()
        
    /// Configura os elementos iniciais da View.
    /// - Parameter cash: cash com os dados para serem inseridos nas subviews.
    func setupCashView(cash: Cash) {
        self.setupImage(bannerURL: cash.bannerURL)
        self.setupTitle(title: cash.title)
        self.setupActivityIndicator()
    }
    
    /// Configura o título da View.
    /// - Parameter title: String que contém o título.
    private func setupTitle(title: String){
        self.addSubview(titleView)
        
        self.titleView.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        self.titleView.textColor = UIColor(rgb: 0x1F3D4C)
        
        let range = (title as NSString).range(of: "Cash")

        let mutableAttributedString = NSMutableAttributedString.init(string: title)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(rgb: 0x444A4C), range: range)

        titleView.attributedText = mutableAttributedString
        
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        self.titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        self.titleView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        self.titleView.bottomAnchor.constraint(equalTo: self.imageView.topAnchor, constant: self.frame.height * -0.05).isActive = true
    }
    
    /// Configura a imagem da view.
    /// - Parameter bannerURL: URL para realizar a requisição HTTP e buscar a imagem.
    private func setupImage(bannerURL: URL){
        
        self.addSubview(self.imageView)
        self.imageView.backgroundColor = .blue
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.frame.height * -0.05).isActive = true

        self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        self.imageView.layer.cornerRadius = 15
        self.imageView.clipsToBounds = true
        
        self.cashVM.fetchImage(imageURL: bannerURL) { (result) in
            switch result {
            case .success(let image):
                if let image = image {
                    self.imageView.image = image
                    self.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /// Configura o Activity Indicator
    private func setupActivityIndicator() {
        self.activityIndicator.style = .medium
        self.activityIndicator.startAnimating()
        self.imageView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.imageView.centerYAnchor).isActive = true
    }
}

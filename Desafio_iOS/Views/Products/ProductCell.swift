//
//  ProductCell.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation
import UIKit

/// Célula de um Produto
class ProductCell: UICollectionViewCell {
    //MARK: Variáveis
    let productVM = ProductViewModel()
    
    var activityIndicator = UIActivityIndicatorView()
    var imageView = UIImageView()
    
    let backView = UIView()
    
    /// Configuração inicial da célula.
    /// - Parameter product: Produto com os dados que vão ser inseridos na célula.
    func setupCell (product: Product) {
        self.setupBackgroundView()
        self.setupImage(bannerURL: product.imageURL)
        self.setupActivityIndicator()
    }
    
    /// Configura a view de background.
    func setupBackgroundView() {
        self.addSubview(backView)
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        backView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        backView.backgroundColor = .clear
        backView.layer.cornerRadius = 20.0
        
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        
    }
    
    /// Configura o Activity Indicator
    func setupActivityIndicator() {
        self.activityIndicator.style = .medium
        self.activityIndicator.startAnimating()
        self.imageView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.imageView.centerYAnchor).isActive = true
    }
    
    /// Configura a imagem
    /// - Parameter bannerURL: URL da imagem para realizar a requisição HTTP.
    func setupImage(bannerURL: URL) {
        self.addSubview(imageView)
        
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: self.frame.width * 0.5).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.5).isActive = true
        
        self.productVM.fetchImage(imageURL: bannerURL) { (result) in
            switch result{
            case .success(let image):
                if let image = image {
                    self.imageView.image = image
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

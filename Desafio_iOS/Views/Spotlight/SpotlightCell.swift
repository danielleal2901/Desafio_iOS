//
//  SpotlightCell.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation
import UIKit

/// Célula de um Spotlight
class SpotlightCell: UICollectionViewCell {
    
    //MARK: Variáveis
    let spotlightVM = SpotlightViewModel()
    
    var activityIndicator = UIActivityIndicatorView()
    var imageView = UIImageView()
    
    /// Configuração inicial da célula.
    /// - Parameter product: Produto com os dados que vão ser inseridos na célula.
    func setupCell (spotlight: Spotlight) {
        self.setupRoundedCell()
        self.setupImage(bannerURL: spotlight.bannerURL)
        self.setupActivityIndicator()
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
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        
        self.spotlightVM.fetchImage(imageURL: bannerURL) { (result) in
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
    
    /// Configura a célula para ficar arredondada.
    func setupRoundedCell() {
        self.layer.cornerRadius = 20
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 3.0)
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
}

//
//  ProductsView.swift
//  Desafio_iOS
//
//  Created by Daniel Leal on 21/11/20.
//

import Foundation
import UIKit

/// View de Produtos
class ProductsView: UIView {
    
    //MARK: Variáveis
    var products : [Product] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    let titleView = UILabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    /// Configuração inicial da view
    /// - Parameter viewSize: Size que vai ser setado na view
    func setupProductsView(viewSize: CGSize) {
        self.setupCollection(viewSize)
        self.setupTitle(viewSize)
        
        self.collectionView.dataSource = self
    }
    
    /// Configura o Título da View
    /// - Parameter viewSize: Size que vai ser setado na view
    private func setupTitle(_ viewSize: CGSize){
        self.addSubview(titleView)
        
        self.titleView.text = "Produtos"
        
        self.titleView.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        self.titleView.textColor = UIColor(rgb: 0x1F3D4C)
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        self.titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        self.titleView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        self.titleView.bottomAnchor.constraint(equalTo: self.collectionView.topAnchor, constant: viewSize.height * -0.07).isActive = true
    }
    
    /// Configura a collection view
    /// - Parameter viewSize: Size que vai ser setado na view
    private func setupCollection(_ viewSize: CGSize) {
        self.addSubview(collectionView)
        
        self.collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "productCell")
        
        self.collectionView.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: viewSize.width * 0.35, height: viewSize.height * 0.52)
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: viewSize.width * 0.1).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: viewSize.height * -0.05).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
    }
    
}

extension ProductsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell{
            let product = products[indexPath.row]
            cell.setupCell(product: product)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}

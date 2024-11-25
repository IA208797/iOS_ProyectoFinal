//
//  VistaDeArmadura.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 25/11/24.
//

import UIKit

class VistaDeArmadura: UICollectionViewCell {
    let nombre = UILabel()
    let tipo = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurarVista()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configurarVista()
    }
    
    private func configurarVista() {
        nombre.translatesAutoresizingMaskIntoConstraints = false
        tipo.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nombre)
        addSubview(tipo)
        
        NSLayoutConstraint.activate([
            nombre.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nombre.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nombre.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            tipo.topAnchor.constraint(equalTo: nombre.bottomAnchor, constant: 8),
            tipo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tipo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
        
        nombre.font = UIFont.boldSystemFont(ofSize: 16)
        tipo.font = UIFont.systemFont(ofSize: 14)
        tipo.textColor = .gray
    }
}
